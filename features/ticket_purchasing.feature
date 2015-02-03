@ticketPurchasing
Feature: ticket purchasing
  As a Movietix visitor
  I want to be able to purchase tickets for movie showtimes
  So that I don't have to purchase tickets at the theater

  Scenario: basic ticket purchasing flow if unauthenticated
    Given I am not logged in
     When I select a showtime to go to
      And I log in
      And I purchase some tickets
     Then I get a purchase confirmation
      And I can see my purchase on the account page

  #exercise - basic ticket purchasing flow if authenticated
    # given I am logged in
    # when I select a showtime to go to
    # and I purchase some tickets
    # then I get a purchase confirmation
    # and I can see my purchase on the account page
