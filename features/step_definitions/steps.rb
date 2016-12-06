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
