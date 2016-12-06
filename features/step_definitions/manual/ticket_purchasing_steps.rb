Given(/^I go to the movies page as an unauthenticated user$/) do
  ask 'Log out if logged in'
  ask 'Go to the movies page'
end

When(/^I select a showtime to attend$/) do
  ask 'Click on a movie title'
  ask 'Click on the showtimes link when it appears'
  ask 'Select the first available showtime'
  yes_no 'Are you on the showtime info page?'
  yes_no 'Does the page look OK?'
  yes_no 'Is it asking you to log in?'
end

And(/^I log in$/) do
  ask 'Log in with "user1", "P4ssw0rd"'
end

And(/^I purchase tickets to that showtime$/) do
  ask 'Click on Buy Tix and enter 4 tickets'
  ask 'Click on confirm'
  ask "Enter payment information and click complete purchase\n
 name: bruce wayne\n
 cc num: 1111222233334444\n
 month: October\n
 year: 2017\n
 street address: 5555 glendon ct\n"
end

Then(/^I see a purchase confirmation$/) do
  yes_no 'Are you on the You Got Tix! page?'
  yes_no 'Do you see a purchase confirmation?'
end