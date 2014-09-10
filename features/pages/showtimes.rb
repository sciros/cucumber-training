require_relative 'base_page'

class Showtimes < BasePage
  link(:first_showtime, :id => 'showtime_1_1')

  def select_first_showtime
    self.first_showtime
  end
end