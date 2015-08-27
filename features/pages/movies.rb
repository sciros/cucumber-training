require_relative 'base_page'

class Movies < BasePage
  page_url(BASE_URL + '/movie/listAll')

  div(:movie_list, :id => 'movies_accordion') #dont hide 'movies' in base page
  h3(:first_movie, :id => 'movie_heading_1')
  link(:view_movie_showtimes, :id => 'movie_showtimes_1')

  def view_first_movie_showtimes
    self.first_movie_element.click
    self.view_movie_showtimes
  end

  def view_first_movie_details
    self.first_movie_element.click
  end
end