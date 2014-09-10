Given /^I am not (?:logged in|authenticated)$/ do
  visit Account do |account_page|
    if account_page.logout?
      account_page.logout
      on Login do |login_page|
        login_page.wait_until(5) do
          login_page.text.include? 'successful'
        end
      end
    end
  end
end

Given /^I log in$/ do
  visit(Login).log_in_with('user1','P4ssw0rd')
  on Account do|account_page|
    account_page.wait_until(5) do
      account_page.text.include? 'Welcome'
    end
  end
end

Given /^I log out$/ do
  on(Account).logout
end

Given /^I try to log in with invalid credentials$/ do
  visit(Login).log_in_with('user1','bad password')
end
