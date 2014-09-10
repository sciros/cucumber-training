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
end

Given /^I try to log in with invalid credentials$/ do
  visit(Login).log_in_with('user1','bad password')
end

Then /^I see an authentication error message$/ do
  on Login do |login_page|
    login_page.wait_until(5) do
      login_page.text.include? 'bad credentials'
    end
  end
end

Given /^I can visit the Movies page from the (.+) page$/ do |page_name|
  visit get_page_class(page_name) do |page|
    page.movies #click on link
    on Movies do |movies_page|
      movies_page.wait_until(5) do
        movies_page.movie_list? #verify that we are on the movies page
      end
    end
  end
end