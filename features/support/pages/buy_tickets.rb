require_relative 'base_page'

class BuyTickets < BasePage
  link(:start_purchase, :text => 'Buy Tix')
  text_field(:number_of_tickets, :id => 'numberOfTickets')
  button(:submit_number_of_tickets, :name => 'reserve-tickets')

  def enter_number_of_tickets(number_of_tickets)
    start_purchase
    self.number_of_tickets= number_of_tickets
    submit_number_of_tickets
  end
end