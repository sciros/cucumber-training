Given /^I successfully log in with valid credentials$/ do
  @browser.goto(BASE_URL + '/login')
  @browser.text_field(:id => 'username').set 'user1'
  @browser.text_field(:id => 'password').set 'P4ssw0rd'
  @browser.button(:name => 'commit').click
end

Given /^I am not logged in$/ do
  logout_link = @browser.link(text: /Logout/)
  logout_link.click if logout_link.present?
end

When /^I am logged in$/ do
  Watir::Wait.until(timeout: 5) {
    @browser.text.include? 'Welcome'
  }
end

Then /^I am on the account page$/ do
  Watir::Wait.until(timeout: 5) {
    @browser.text.include? 'This is your account'
  }
end

Then /^I am on the login page$/ do
  expect(@browser.title).to include('Login')
end

Given /^I try to log in with invalid credentials$/ do
  @browser.goto(BASE_URL + '/login')
  @browser.text_field(:id => 'username').set 'user1'
  @browser.text_field(:id => 'password').set 'bad password'
  @browser.button(:name => 'commit').click
end

Then /^I see an authentication error message$/ do
  Watir::Wait.until(timeout: 5) {
    @browser.text.include? 'Sorry'
  }
end
