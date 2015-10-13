Given /^I am not (?:logged in|authenticated)$/ do
  visit Account do |account_page|
    if account_page.logout?
      account_page.logout
    end
  end
end

Given /^I log in with valid credentials$/ do
  visit(Login).log_in_with('user1','P4ssw0rd')
  on Account do |account_page|
    account_page.wait_until(5, 'Logout link did not appear') do
      account_page.logout?
    end
  end
end

Then /^I am on the account page$/ do
  @current_page.should_contain_text 'This is your account'
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
  on(Login).should_contain_text 'Sorry'
end

Given /^I can visit the Movies page from any page$/ do
  %w(Theaters Login).each do |page_name|
    visit page_name do |page|
      page.view_movies
      on(Movies).movie_list_element.when_present(10) #verify we are on the movies page
    end
  end
end

#exercise
Given /^I can visit the Theaters page from any page$/ do
  %w(Movies Login).each do |page_name|
    visit page_name do |page|
      page.view_theaters
      on(Theaters).theater_list_element.when_present(10) #verify we are on the theaters page
    end
  end
end