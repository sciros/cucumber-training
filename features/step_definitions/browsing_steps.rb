Then /^I am on the (.+) page$/ do |page|
  on(page.gsub(' ','_').camelize) # convert easily to a constant (class) name
end

Given /^I can visit the Movies page from any page$/ do
  %w(Theaters Login).each do |page_name|
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