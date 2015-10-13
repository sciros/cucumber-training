Given /^I log in with valid credentials$/ do
  visit Login do |login_page|
    login_page.username = 'user1'
    login_page.password = 'P4ssw0rd'
    login_page.login
  end
  @current_page.wait_until(5, 'Failed to verify login') {
    @current_page.text.include? 'Logout'
  }
end

Then /^I am on the account page$/ do
  on Account do |account_page|
    expect(account_page.text).to include('This is your account')
  end
end

When /^I can log out$/ do
  on(Account).logout
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
