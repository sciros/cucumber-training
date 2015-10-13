Given /^I am not (?:logged in|authenticated)$/ do
  visit Account do |account_page|
    if account_page.logout?
      account_page.logout
    end
  end
end

Given /^I log in$/ do
  visit(Login).log_in_with('user1','P4ssw0rd')
  #this is page-agnostic which makes sense here
  @current_page.should_contain_text 'Welcome'
end

Given /^I log in with valid credentials$/ do
  step 'I log in'
end

Given /^I try to log in with invalid credentials$/ do
  visit(Login).log_in_with('user1','bad password')
end

Then /^I see an authentication error message$/ do
  on(Login).should_contain_text 'Sorry'
end

When /^I can log out$/ do
  on(Account).logout
  expect(@current_page.text).not_to include('Welcome')
end