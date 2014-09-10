Given /^I am on the account page$/ do
  on Account do |account_page|
    account_page.wait_until(5) do
      account_page.text.include? 'Name:'
    end
  end
end

Given /^I am on the login page$/ do
  on Login do |login_page|
    login_page.wait_until(5) do
      login_page.login?
    end
  end
end

Given /^I can visit the Movies page from the (.+) page$/ do |page_name|
  visit get_page_class(page_name) do |page|
    page.movies #click on link
    on Movies do |movies_page|
      movies_page.wait_until(5) do
        movies_page.movies? #verify that we are on the movies page
      end
    end
  end
end

Given(/^I select a movie from the movies page$/) do
  visit(Movies).view_first_movie_showtimes
end

When(/^I select a showtime from the list of available showtimes$/) do
  on Showtimes do |showtimes_page|
    showtimes_page.select_first_showtime
    on BuyTickets do |buy_tickets_page|
      buy_tickets_page.wait_until(5) do
        buy_tickets_page.text.include? 'Log in to buy'
      end
    end
  end
end