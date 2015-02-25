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

  @exercise
  Scenario: ticket purchasing through theaters page
    Given I am not logged in
     When I select a showtime to go to through the theaters list
      And I log in
      And I purchase some tickets
     Then I get a purchase confirmation
      And I can see my purchase on the account page
