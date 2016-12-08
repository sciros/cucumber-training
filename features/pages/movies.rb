require_relative 'base_page'

class Movies < BasePage
  page_url(BASE_URL + '/movie/listAll')

  div(:movie_list, id: 'movies_accordion')
  h3(:first_movie, id: 'movie_heading_1')
  link(:view_movie_showtimes, id: 'movie_showtimes_1')

  def initialize_page
    movie_list_element.when_present 5
  end

  def view_first_movie_showtimes
    first_movie_element.click
    view_movie_showtimes
  end
end