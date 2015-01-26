require_relative 'base_page'

class Movies < BasePage
  page_url($base_url+'/movie/listAll')

  div(:movie_list, :id => 'movies_accordion')
end