Given /^I log in with valid credentials$/ do
  visit(Login).log_in_with('user1','P4ssw0rd')
  @current_page.wait_until(5, 'Never saw welcome message') do
    @current_page.text.include? 'Welcome'
  end
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

Given /^I try to log in with invalid credentials$/ do
  visit(Login).log_in_with('user1','bad password')
end

Then /^I am on the login page$/ do
  on Login do |login_page|
    login_page.wait_until(5) {
      login_page.login?
    }
  end
end

Then /^I see an authentication error message$/ do
  on Login do |login_page|
    login_page.wait_until(5) do
      login_page.text.include? 'Sorry'
    end
  end
end