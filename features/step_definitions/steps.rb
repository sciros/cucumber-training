Given /^I can log in with valid credentials$/ do
  visit Login do |login_page|
    login_page.username = 'user1'
    login_page.password = 'P4ssw0rd'
    login_page.login
  end
  on Movies do |movies_page|
    movies_page.wait_until(5) do
      movies_page.text.include? 'Now Playing' and movies_page.text.include? 'Welcome'
    end
  end
end

When /^I can log out$/ do
  on Movies do |movies_page|
    movies_page.logout
    expect(movies_page.text).not_to include('Welcome')
  end
end

Then /^I am on the login page$/ do
  on Login do |login_page|
    login_page.wait_until(5) do
      login_page.login? #checks element's existence
    end
  end
end

Given /^I try to log in with invalid credentials$/ do
  visit Login do |login_page|
    login_page.username = 'user1'
    login_page.password = 'bad password'
    login_page.login
  end
end

Then /^I see an authentication error message$/ do
  on Login do |login_page|
    login_page.wait_until(5) do
      login_page.text.include? 'Sorry'
    end
  end
end
