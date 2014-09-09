require_relative 'base_page'

class Movies < BasePage
  page_url($base_url+'/movies')

  div(:movie_list, :id => 'movies_accordion')
end