require_relative 'base_page'

class BuyTickets < BasePage
  #changed button to link for first one (was start_purchase_button)
  #TODO rename start_purchase_link to start_purchase since that actually reads better... same with button
  link(:start_purchase_link, :text => 'Buy Tix')
  text_field(:number_of_tickets, :id => 'tix')
  button(:submit_number_of_tickets_button, :name => 'commit')

  def enter_number_of_tickets(number_of_tickets)
    self.start_purchase_link
    self.number_of_tickets= number_of_tickets
    self.submit_number_of_tickets_button
  end
end