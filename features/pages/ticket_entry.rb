require_relative 'base_page'

class TicketEntry < BasePage
  text_field(:number_of_tickets, id: 'numberOfTickets')
  button(:submit_number_of_tickets, name: 'reserve-tickets')

  def enter_number_of_tickets(number_of_tickets)
    self.number_of_tickets= number_of_tickets
    submit_number_of_tickets
  end
end