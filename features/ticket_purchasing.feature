@ticketPurchasing
Feature: ticket purchasing
  As a Movietix visitor
  I want to be able to purchase tickets for movie showtimes
  So that I don't have to purchase tickets at the theater

  @manual
  Scenario: User must log in to successfully purchase tickets to a movie
    Given I go to the movies page as an unauthenticated user
    When I select a showtime to attend
    And I log in
    And I purchase tickets to that showtime
    Then I see a purchase confirmation


