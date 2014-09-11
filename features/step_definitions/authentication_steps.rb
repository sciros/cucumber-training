Given /^I am not (?:logged in|authenticated)$/ do
  visit Account do |account_page|
    if account_page.logout?
      account_page.logout
      on(Login).includes_text 'successful'
    end
  end
end

Given /^I log in$/ do
  visit(Login).log_in_with($username,'P4ssw0rd')
  on(Account).includes_text 'Welcome'
end

Given /^I log out$/ do
  on(Account).logout
end

Given /^I try to log in with invalid credentials$/ do
  visit(Login).log_in_with($username,'bad password')
end

Then /^I see an authentication error message$/ do
  on(Login).includes_text 'bad credentials'
end
