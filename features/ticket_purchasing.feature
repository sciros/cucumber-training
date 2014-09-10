Feature: ticket purchasing
  As a Movietix visitor
  I want to be able to purchase tickets for movie showtimes
  So that I don't have to purchase tickets at the theater

  Acceptance Criteria
  [ ] user does not have to be logged in to browse to a showtime
  [ ] user has to log in prior to purchasing tickets
  [ ] user has to enter the number of tickets before paying
  [ ] user has to provide credit card information before confirming purchase
  [ ] user's purchase history should be visible in user's account page

  Background: user is not logged in
    Given I am not logged in

  Scenario: basic ticket purchasing flow
    Given I select a movie from the movies page
      And I select a showtime from the list of available showtimes
     When I log in
      And I enter the number of tickets I want to purchase
      And I submit my payment information
     Then I get a purchase confirmation
      And I can see my purchase on the account page