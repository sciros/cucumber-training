After('@ticketPurchasing') do
  user = User.where(:username => $username).first
  purchases_from_db = Purchase.where(:user_id => user, :number_of_tickets => $number_of_tickets)
  purchases_from_db.each do |purchase|
    Purchase.delete(purchase)

    # restore tickets available to showtime, reduce tickets sold
    showtime = Showtime.find(purchase.showtime_id)
    showtime.seats_available += $number_of_tickets
    showtime.tickets_sold -= $number_of_tickets
    Showtime.update(showtime.id, {:seats_available => showtime.seats_available,
                                  :tickets_sold => showtime.tickets_sold})
  end
end

After do |scenario|
  if scenario.failed?
    Dir::mkdir('screenshots') if not File.directory?('screenshots')
    screenshot = "./screenshots/FAILED_#{scenario.name.gsub(' ','_').gsub(/[^0-9A-Za-z_]/, '')}.png"
    @browser.driver.save_screenshot(screenshot)
    embed screenshot, 'image/png'
  end
end