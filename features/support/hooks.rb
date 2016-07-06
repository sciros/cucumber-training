require 'json'

After('@ticketPurchasing') do
  user = User.where(:username => USERNAME).first
  purchases_from_db = Purchase.where(:user_id => user, :number_of_tickets => @number_of_tickets)
  purchases_from_db.each do |purchase|
    # restore tickets available to showtime, reduce tickets sold
    showtime = Showtime.find(purchase.showtime_id)
    showtime.seats_available += @number_of_tickets
    showtime.tickets_sold -= @number_of_tickets
    showtime.save

    purchase.destroy
  end
end

#exercise
After('@registration') do
  new_user = User.find_by(username: @new_username)
  UserRole.delete_all(user: new_user)
  new_user.destroy
end

After do |scenario|
  if scenario.failed?
    Dir::mkdir('screenshots') unless File.directory?('screenshots')
    screenshot = "./screenshots/FAILED_#{scenario.name.gsub(' ','_').gsub(/[^0-9A-Za-z_]/, '')}.png"
    @browser.driver.save_screenshot(screenshot)
    embed screenshot, 'image/png'
  end
end

After do
  #record some diagnostic information in the reports
  begin
    capabilities = @browser.driver.send('bridge').capabilities.send('capabilities')
    dimensions = {:width => @browser.window.size.width, :height => @browser.window.size.height }
    capabilities[:dimensions] = dimensions
    puts capabilities
  rescue
    errors = {:error => 'Unable to include user agent capabilities.'}
    puts errors # map for type consistency in recording both success and failure
  end
end