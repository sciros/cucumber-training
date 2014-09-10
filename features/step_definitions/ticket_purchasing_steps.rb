When(/^I enter the number of tickets I want to purchase$/) do
  on(BuyTickets).enter_number_of_tickets(3)
end

When(/^I submit my payment information$/) do
  on(Payment).enter_payment_information
end

Then(/^I get a purchase confirmation$/) do
  on BuyTickets do |page|
    page.wait_until(5) do
      page.text.include? 'You got tix!'
    end
  end
end

When(/^I can see my purchase on the account page$/) do
  visit Account do |page|
    page.wait_until(5) do
      page.text.include? '3 to'
    end
  end
end