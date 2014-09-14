#TODO skip all this it's pointless since we're throwing it away immediately (the extracting and calling steps)

Given /^I log in with "(.+)", "(.+)"$/ do |username, password|
  visit Login do |login_page|
    login_page.username = username
    login_page.password = password
    login_page.login
  end
end

Given /^I log in$/ do
  step 'I log in with "user1", "P4ssw0rd"'
  on Login do|login_page|
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
  on(Login).login_element.when_present(5)
  #on Login do |login_page|
    #login_page.wait_until(5) do
    #  login_page.login?
    #end
  #end
end

Given /^I try to log in with invalid credentials$/ do
  step 'I log in with "user1", "bad password"'
end

Then /^I see an authentication error message$/ do
  on Login do |login_page|
    login_page.wait_until(5) do
      login_page.text.include? 'bad credentials'
    end
  end
end