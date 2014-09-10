Given /^I see "([^"]*)"$/ do |text|
  Watir::Wait.until(5) {
    @browser.text.include? text
  }
end