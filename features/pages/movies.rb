require_relative 'base_page'

class Movies < BasePage
  page_url($base_url+'/movies')

  #TODO since 'movies' is now 'view_movies' it's less about hiding and more about being descriptive
  div(:movie_list, :id => 'movies_accordion') #dont hide 'movies' in base page
end