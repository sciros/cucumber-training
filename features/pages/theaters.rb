require_relative 'base_page'

class Theaters < BasePage
  page_url(BASE_URL + '/theater/listAll')

  div(:theater_list, :id => 'theaters_accordion')
end