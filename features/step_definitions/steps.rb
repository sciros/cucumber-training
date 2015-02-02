Given /^I am not (?:logged in|authenticated)$/ do
  visit Movies do |movies_page|
    if movies_page.logout?
      movies_page.logout
      movies_page.wait_until(5) {
        movies_page.text.include? 'Log In'
      }
    end
  end
end

Given /^I can log in with valid credentials$/ do
  visit(Login).log_in_with('user1','P4ssw0rd')
  on Movies do |movies_page|
    movies_page.wait_until(5) do
      movies_page.text.include? 'Now Playing' and movies_page.text.include? 'Welcome'
    end
  end
end

When /^I can log out$/ do
  @current_page.logout
  expect(@current_page.text).not_to include('Welcome')
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