Given /^I try to log in$/ do
  visit Login do |login_page|
    login_page.username = 'user1'
    login_page.password = 'P4ssw0rd'
    login_page.login
  end
end

When /^I am on the account page$/ do
  on Account do |account_page|
    account_page.wait_until(5) do
      account_page.text.include? 'This is your account'
    end
  end
end

When /^I am logged in$/ do
  on Account do |account_page|
    account_page.wait_until(5, 'Welcome text never appeared') do
      account_page.text.include? 'Welcome'
    end
  end
end

When /^I try to log out$/ do
  on(Account).logout
end

When /^I am not logged in$/ do
  #remove watir-webdriver @browser api and replace with page-object api
  expect(@current_page.text).not_to include('Welcome')
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
  on Login do |login_page|
    login_page.wait_until(5) do
      login_page.text.include? 'Sorry'
    end
  end
end
