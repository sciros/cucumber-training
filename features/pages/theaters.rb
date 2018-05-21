require_relative 'base_page'

class Theaters < BasePage
  direct_url(BASE_URL + '/theater/listAll')

  div(:theater_list, id: 'theaters_accordion')

  #exercise
  h3(:first_theater, id: 'theater_heading_1')
  link(:view_theater_showtimes, id: 'theater_showtimes_1')

  def initialize_page
    theater_list_element.when_present 5
  end

  #exercise
  def view_first_theater_showtimes
    self.first_theater_element.click
    # this element does not appear right away.. but Watir 6+ seems to be flexible around that
    self.view_theater_showtimes
  end
end