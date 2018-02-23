Then /^I am on the (.+) page$/ do |page|
  on(page.gsub(' ', '_').camelize) # convert easily to a constant (class) name
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

When(/^I select a showtime to go to through the movie list$/) do
  # view first showtime on movies page
  # select first showtime on the movie showtimes page
  # verify that we are on the showtime info page
  visit(Movies).view_first_movie_showtimes
  on(MovieShowtimes).select_first_showtime
  on(ShowtimeInfo).should_contain_text 'Showtime info'
end

#exercise
When(/^I select a showtime to go to through the theater list$/) do
  visit(Theaters).view_first_theater_showtimes
  on(TheaterShowtimes).select_first_showtime
  on(ShowtimeInfo).should_contain_text 'Showtime info'
end

Given(/^I go to the (.+) page$/) do |page|
  visit(page.gsub(' ','_').camelize)
end

Then(/^I see a list of all movies now playing$/) do
  on Movies do |movies_page|
    movie_listing = movies_page.movie_list #get text from div
    Movie.all.each do |movie|
      #OR fail("#{movie.title} is missing") unless movie_listing.include? movie.title
      expect(movie_listing).to include(movie.title)
    end
  end
end