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