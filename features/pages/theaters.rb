require_relative 'base_page'

class Theaters < BasePage
  page_url($base_url+'/theater/listAll')

  div(:theater_list, :id => 'theaters_accordion')

  #exercise
  h3(:first_theater, :id => 'theater_heading_1')
  link(:view_theater_showtimes, :id => 'theater_showtimes_1')

  #exercise
  def view_first_theater_showtimes
    self.first_theater_element.click
    # this element does not appear right away.
    # doing a self.view_theater_showtimes_element will result in
    # an ElementNotVisibleError
    self.view_theater_showtimes_element.when_visible(10).click
  end
end