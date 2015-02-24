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