Given /^I log in$/ do
  steps %q{
    Given I go to the login page
     When I enter "user1" into the username
      And I enter "P4ssw0rd" into the password
      And I press the login button
     Then I am logged in
  }
end

Given /^I go to the login page$/ do
  @browser.goto(BASE_URL + '/login')
end

When /^I enter "([^"]*)" into the username$/ do |username|
  @browser.text_field(:id => 'login').set username
end

When /^I enter "([^"]*)" into the password$/ do |password|
  @browser.text_field(:id => 'password').set password
end

When /^I press the login button$/ do
  @browser.button(:name => 'commit').click
end

Then /^I am logged in$/ do
  Watir::Wait.until(5) {
    @browser.text.include? 'Welcome'
  }
end

When /^I am on the account page$/ do
  @browser.url.should == BASE_URL + '/account'
  Watir::Wait.until(5) {
    @browser.text.include? 'Name:'
  }
end

Given /^I log out$/ do
  step 'I click the logout link'
end

When /^I click the logout link$/ do
  @browser.link(:text => /Logout/).click
end

Then /^I am on the login page$/ do
  login_button = @browser.button(:name => 'commit')
  Watir::Wait.until(5) {
    login_button.exists?
  }
end

Given /^I try to authenticate with invalid credentials$/ do
  steps %q{
   Given I go to the login page
    When I enter "user1" into the username
    And I enter "bad password" into the password
    And I press the login button
  }
end

Then /^I see "([^"]*)"$/ do |text|
  Watir::Wait.until(5) {
    @browser.text.include? text
  }
end