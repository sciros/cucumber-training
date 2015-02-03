require_relative 'base_page'

class Showtimes < BasePage
  link(:select_first_showtime, :id => 'showtime_1_1')
end