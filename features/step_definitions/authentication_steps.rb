Given /^I can successfully log in with valid credentials$/ do
  visit(Login).log_in_with 'user1', 'P4ssw0rd'
  @current_page.should_contain_text 'Welcome'
end

Given /^I am not (?:logged in|authenticated)$/ do
  #can be any page since we are using common elements
  #don't need to actually be on that page.. so make sure
  #to NOT verify that you are indeed on that page
  on BasePage do |page|
    page.log_out if page.log_out?
    expect(page.text).not_to include('Welcome')
  end
end

Given /^I try to log in with invalid credentials$/ do
  visit(Login).log_in_with 'user1', 'bad password'
end

Then /^I see an authentication error message$/ do
  @current_page.should_contain_text 'Sorry'
end

Given /^I log in to purchase tickets$/ do
  on(ShowtimeInfo).visit_login_page
  on(Login).log_in_with('user1','P4ssw0rd')
end
