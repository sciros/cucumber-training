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
    on(BuyTickets).includes_text 'Log in to buy'
  end
end

Given(/^I visit the [Mm]ovies page$/) do
  visit(Movies).movie_list_element.when_present(5)
end

Then(/^I can see a list of all movies now playing$/) do
  on Movies do |movies_page|
    movie_listing = movies_page.movie_list #get text from div
    Movie.all.each do |movie|
      #TODO or do expect(movie.listing.include? movie.name) to take advantage of rspec
      fail("#{movie.name} is missing") unless movie_listing.include? movie.name
    end
  end
end