Given /^I successfully log in with valid credentials$/ do
  steps %q{
    Given I go to the login page
     When I enter "user1" into the username
      And I enter "P4ssw0rd" into the password
      And I press the login button
  }
end

Given /^I am not logged in$/ do
  logout_link = @browser.link(text: /Logout/)
  logout_link.click if logout_link.present?
end

Given /^I go to the login page$/ do
  @browser.goto(BASE_URL + '/login')
end

When /^I enter "([^"]*)" into the username$/ do |username|
  @browser.text_field(:id => 'username').set username
end

When /^I enter "([^"]*)" into the password$/ do |password|
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

Then /^I am on the account page$/ do
  Watir::Wait.until(timeout: 5) {
    @browser.text.include? 'This is your account'
  }
end

Then /^I am on the login page$/ do
  expect(@browser.title).to include('Login')
end

Given /^I try to log in with invalid credentials$/ do
  steps %q{
   Given I go to the login page
    When I enter "user1" into the username
    And I enter "bad password" into the password
    And I press the login button
  }
end

Then /^I see an authentication error message$/ do
  Watir::Wait.until(timeout: 5) {
    @browser.text.include? 'Sorry'
  }
end
