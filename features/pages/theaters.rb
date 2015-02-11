require_relative 'base_page'

class Theaters < BasePage
  page_url($base_url+'/theater/listAll')

  div(:theater_list, :id => 'theaters_accordion')
end