Given /^I am on the account page$/ do
  on(Account).includes_text 'Name:'
end

Given /^I am on the login page$/ do
  on(Login).login_element.when_present(5)
end

Given /^I can visit the Movies page from the (.+) page$/ do |page_name|
  visit get_page_class(page_name) do |page|
    page.movies #click on link
    on(Movies).movie_list_element.when_present(5) #verify we are on the movies page
  end
end

Given(/^I select a movie from the movies page$/) do
  visit(Movies).view_first_movie_showtimes
end

When(/^I select a showtime from the list of available showtimes$/) do
  on Showtimes do |showtimes_page|
    showtimes_page.select_first_showtime
    #TODO should be ShowtimeInfo or it's hard to make sense of...
    # then log in
    # then end up on the BuyTickets page
    on(BuyTickets).includes_text 'Log in to buy'
  end
end