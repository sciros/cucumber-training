Given /^I log in$/ do
  visit Login do |login_page|
    login_page.username = 'user1'
    login_page.password = 'P4ssw0rd'
    login_page.login
    login_page.wait_until(5) do
      login_page.text.include? 'Welcome'
    end
  end
end

When /^I am on the account page$/ do
  on Account do |account_page|
    account_page.wait_until(5) do
      account_page.text.include? 'Name:'
    end
  end
end

When /^I log out$/ do
  on(Account).logout
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

Then /^I see "([^"]*)"$/ do |text|
  Watir::Wait.until(5) {
    @browser.text.include? text
  }
end