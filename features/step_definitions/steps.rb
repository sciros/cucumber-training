Given /^I successfully log in with valid credentials$/ do
  visit(Login).log_in_with 'user1', 'P4ssw0rd'
  @current_page.wait_until(5, 'Never saw welcome message') do
    @current_page.text.include? 'Welcome'
  end
end

Then /^I am on the account page$/ do
  on(Account)
end

Given /^I am not logged in$/ do
  #can be any page since we are using common elements
  #don't need to actually be on that page.. so make sure
  #to NOT verify that you are indeed on that page
  on BasePage do |page|
    page.logout if page.logout?
    expect(page.text).not_to include('Welcome')
  end
end

Given /^I try to log in with invalid credentials$/ do
  visit(Login).log_in_with 'user1', 'bad password'
end

Then /^I am on the login page$/ do
  on(Login)
end

Then /^I see an authentication error message$/ do
  @current_page.wait_until(5) do
    @current_page.text.include? 'Sorry'
  end
end
