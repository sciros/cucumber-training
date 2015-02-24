Given /^I try to log in$/ do
  @browser.goto($base_url + '/login')
  @browser.text_field(:id => 'username').set 'user1'
  @browser.text_field(:id => 'password').set 'P4ssw0rd'
  @browser.button(:name => 'commit').click
end


When /^I am logged in$/ do
  Watir::Wait.until(5) {
    @browser.text.include? 'Welcome'
  }
end

Then /^I am not logged in$/ do
  expect(@browser.text).not_to include('Welcome')
end

When /^I am on the account page$/ do
  Watir::Wait.until(5) {
    @browser.text.include? 'This is your account'
  }
end

When /^I try to log out$/ do
  @browser.link(:text => /Logout/).click
end

Then /^I am on the login page$/ do
  Watir::Wait.until(5) {
    @browser.text.include? 'Log In'
  }
end

Given /^I try to log in with invalid credentials$/ do
  @browser.goto($base_url + '/login')
  @browser.text_field(:id => 'username').set 'user1'
  @browser.text_field(:id => 'password').set 'bad password'
  @browser.button(:name => 'commit').click
end

Then /^I see an authentication error message$/ do
  Watir::Wait.until(5) {
    @browser.text.include? "Sorry"
  }
end