When(/^I enter the number of tickets I want to purchase$/) do
  on(BuyTickets).enter_number_of_tickets($number_of_tickets)
end

When(/^I submit my payment information$/) do
  on(Payment).enter_payment_information
end

Then(/^I get a purchase confirmation$/) do
  on(BuyTickets).includes_text 'You got tix!'
end

When(/^I can see my purchase on the account page$/) do
  visit(Account).includes_text "#{$number_of_tickets} to"
end