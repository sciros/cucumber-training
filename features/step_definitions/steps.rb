When /^I am on the account page$/ do
  on Account do |account_page|
    account_page.wait_until(5, 'Account page did not load') do
      account_page.text.include? 'This is your account'
    end
  end
end

Given /^I can successfully log in with valid credentials$/ do
  visit Login do |login_page|
    login_page.username = 'user1'
    login_page.password = 'P4ssw0rd'
    login_page.login
  end
  #TODO ok to keep this probably since PageObject now coupled only to Watir
  Watir::Wait.until(timeout: 5, message: 'Never saw welcome message') {
    @browser.text.include? 'Welcome'
  }
end

Given /^I am not logged in$/ do
  logout_link = @browser.link(text: /Logout/)
  logout_link.click if logout_link.present?

  expect(@browser.text).not_to include('Welcome')
end

Given /^I go to the login page$/ do
  @browser.goto(BASE_URL + '/login')
end

When 'I enter {string} into the username' do |username|
  @browser.text_field(:id => 'username').set username
end

When 'I enter {string} into the password' do |password|
  @browser.text_field(:id => 'password').set password
end

When /^I press the login button$/ do
  @browser.button(:name => 'commit').click
end

Then /^I am logged in$/ do
  Watir::Wait.until(timeout: 5) {
    @browser.text.include? 'Welcome'
  }
end

Then /^I am on the login page$/ do
  on Login do |login_page|
    login_page.wait_until(5) do
      login_page.login? #checks element's existence
    end
  end
end

Given /^I try to log in with invalid credentials$/ do
  visit Login do |login_page|
    login_page.username = 'user1'
    login_page.password = 'bad password'
    login_page.login
  end
end

Then /^I see an authentication error message$/ do
  @current_page.wait_until(5) do
    @current_page.text.include? 'Sorry'
  end
end
