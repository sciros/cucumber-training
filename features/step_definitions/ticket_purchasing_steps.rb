When(/^I purchase some tickets$/) do
  @number_of_tickets = 3;
  on(BuyTickets).enter_number_of_tickets(@number_of_tickets)
  on(Payment).enter_payment_information
end

Then(/^I get a purchase confirmation$/) do
  @current_page.should_contain_text 'You got tix!'
end

When(/^I can see my purchase on the account page$/) do
  @current_page.view_account
  on(Account).should_contain_text "#{@number_of_tickets} to"
end