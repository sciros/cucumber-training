@ticketPurchasing
Feature: ticket purchasing
  As a Movietix visitor
  I want to be able to purchase tickets for movie showtimes
  So that I don't have to purchase tickets at the theater

  Scenario: purchasing tickets through movies page while unauthenticated
    Given I am not logged in
     When I select a showtime to go to through the movie list
      And I log in to purchase tickets
      And I purchase some tickets
     Then I get a purchase confirmation
      And I can see my purchase on the account page

  @exercise
  Scenario: purchasing tickets through theaters page while unauthenticated
    Given I am not logged in
     When I select a showtime to go to through the theater list
      And I log in to purchase tickets
      And I purchase some tickets
     Then I get a purchase confirmation
      And I can see my purchase on the account page

  #@exercise
  #Scenario: purchasing tickets through movies page starting off authenticated
