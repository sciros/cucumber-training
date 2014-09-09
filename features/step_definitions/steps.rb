Given /^I log in$/ do
  @browser.goto($base_url + '/login')
  @browser.text_field(:id => 'login').set 'user1'
  @browser.text_field(:id => 'password').set 'P4ssw0rd'
  @browser.button(:name => 'commit').click
  Watir::Wait.until(5) {
    @browser.text.include? 'Welcome'
  }
end

When /^I am on the account page$/ do
  @browser.url.should == $base_url + '/account'
  Watir::Wait.until(5) {
    @browser.text.include? 'Name:'
  }
end

When /^I log out$/ do
  @browser.link(:text => /Logout/).click
end

Then /^I am on the login page$/ do
  login_button = @browser.button(:name => 'commit')
  Watir::Wait.until(5) {
    login_button.exists?
  }
end

Given /^I try to log in with invalid credentials$/ do
  @browser.goto($base_url + '/login')
  @browser.text_field(:id => 'login').set 'user1'
  @browser.text_field(:id => 'password').set 'bad password'
  @browser.button(:name => 'commit').click
end

Then /^I see "([^"]*)"$/ do |text|
  Watir::Wait.until(5) {
    @browser.text.include? text
  }
end