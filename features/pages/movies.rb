require_relative 'base_page'

class Movies < BasePage
  page_url(BASE_URL + '/movie/listAll')

  div(:movie_list, :id => 'movies_accordion')
end