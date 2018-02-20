Given /^I can successfully log in with valid credentials$/ do
  visit Login do |login_page|
    login_page.username = 'user1'
    login_page.password = 'P4ssw0rd'
    login_page.submit_credentials

    login_page.wait_until(5, 'Welcome message never appeared') do
      login_page.text.include? 'Welcome'
    end
  end
end

Given /^I am not logged in$/ do
  #can be any page since we are using common elements
  #don't need to actually be on that page.. so make sure
  #to NOT verify that you are indeed on that page
  on BasePage do |page|
    page.logout if page.logout?
    expect(page.text).not_to include('Welcome')
  end
end

Then /^I am on the login page$/ do
  on Login do |login_page|
    login_page.wait_until(5) do
      login_page.submit_credentials? #checks element's existence
    end
  end
end

Given /^I try to log in with invalid credentials$/ do
  visit Login do |login_page|
    login_page.username = 'user1'
    login_page.password = 'bad password'
    login_page.submit_credentials
  end
end

Then /^I see an authentication error message$/ do
  #you don't need to re-instantiate a page every time
  @current_page.wait_until(5) do
    @current_page.text.include? 'Sorry'
  end
end
