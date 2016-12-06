When(/^I view a movie's details$/) do
  ask 'Go to the movies page'
  ask 'Click on "Arachnidman"'
  yes_no('Did the detail section expand?')
end

Then(/^I see the following:$/) do |details|
  details.raw.flatten.each do |detail|
    yes_no("Do you see the #{detail}?")
  end
end