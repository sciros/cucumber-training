require_relative 'base_page'

class Movies < BasePage
  page_url($base_url+'/movies')

  div(:movies, :id => 'movies_accordion')
  h3(:first_movie, :id => 'movie_heading_1')
  link(:first_showtime, :id => 'movie_showtimes_1')

  def view_first_movie_showtimes
    self.first_movie_element.click
    self.first_showtime
  end
end