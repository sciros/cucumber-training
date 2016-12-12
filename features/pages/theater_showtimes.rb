#exercise
require_relative 'base_page'

class TheaterShowtimes < BasePage
  link(:select_first_showtime, id: 'showtime_1_1')
end