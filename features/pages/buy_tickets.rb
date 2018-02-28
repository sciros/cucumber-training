require_relative 'base_page'

class BuyTickets < BasePage
  link(:start_purchase, visible_text: 'Buy Tix')
end