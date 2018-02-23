Then /^I am on the (.+) page$/ do |page|
  on(page.gsub(' ','_').camelize) # convert easily to a constant (class) name
end

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


Given /^I can visit the Movies page from any page$/ do
  [Login, Theaters].each do |page_name|
    visit page_name do |page|
      page.view_movies
      on(Movies) #verify we are on the movies page
    end
  end
end

#exercise
Given /^I can visit the Theaters page from any page$/ do
  %w(Movies Login).each do |page_name|
    visit page_name do |page|
      page.view_theaters
      on(Theaters) #verify we are on the theaters page
    end
  end
end

When(/^I can visit the movies page from the (.*) page$/) do |page_name|
  visit page_name do |page|
    page.view_movies
    on(Movies)
  end
end

When(/^I can visit the movies page from these pages:$/) do |pages|
  pages.raw.flatten.each do |page_name|
    visit page_name do |page|
      page.view_movies
      on(Movies)
    end
  end
end