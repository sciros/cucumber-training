Given /^I try to log in$/ do
  @browser.goto(BASE_URL + '/login')
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

Then /^I am on the account page$/ do
  Watir::Wait.until(5) {
    #good candidate for nested step call of 'I see "This is your account"'
    @browser.text.include? 'This is your account'
  }
end

When /^I try to log out$/ do
  @browser.link(:text => /Logout/).click
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
  Watir::Wait.until(5) {
    @browser.text.include? "Sorry"
  }
end
