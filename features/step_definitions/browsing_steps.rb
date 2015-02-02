Given /^I can visit the Movies page from any page$/ do
  %w(Theaters Login).each do |page_name|
    visit page_name do |page|
      page.view_movies
      on(Movies).movie_list_element.when_present(10) #verify we are on the movies page
    end
  end
end

When(/^I select a showtime to go to$/) do
  visit(Movies).view_first_movie_showtimes
  on(Showtimes).select_first_showtime
  on(ShowtimeInfo).should_contain_text 'Showtime info'
end

Given(/^I visit the [Mm]ovies page$/) do
  visit(Movies).movie_list_element.when_present(5)
end

Then(/^I can see a list of all movies now playing$/) do
  on Movies do |movies_page|
    movie_listing = movies_page.movie_list #get text from div
    Movie.all.each do |movie|
      #TODO or do expect(movie.listing.include? movie.name) to take advantage of rspec
      fail("#{movie.title} is missing") unless movie_listing.include? movie.title
    end
  end
end