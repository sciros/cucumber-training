require_relative 'base_page'

class Movies < BasePage
  page_url(BASE_URL + '/movie/listAll')

  div(:movie_list, id: 'movies_accordion')

  def initialize_page
    movie_list_element.when_present 5
  end
end