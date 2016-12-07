require_relative 'base_page'

class Theaters < BasePage
  page_url(BASE_URL + '/theater/listAll')

  div(:theater_list, :id => 'theaters_accordion')

  def initialize_page
    theater_list_element.when_present 5
  end
end