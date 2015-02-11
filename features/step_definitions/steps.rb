Given /^I can log in with valid credentials$/ do
  visit(Login).log_in_with('user1','P4ssw0rd')
  on Account do |account_page|
    account_page.wait_until(5) do
      account_page.text.include? 'Welcome' and
      account_page.text.include? 'This is your account'
    end
  end
end

When /^I can log out$/ do
  on(Account).logout
  expect(@browser.text).not_to include('Welcome')
end

Given /^I try to log in with invalid credentials$/ do
  visit(Login).log_in_with('user1','bad password')
end

Then /^I see an authentication error message$/ do
  on Login do |login_page|
    login_page.wait_until(5) do
      login_page.text.include? 'Sorry'
    end
  end
end