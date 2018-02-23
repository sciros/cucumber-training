Feature: movie browsing
  As a Movietix visitor
  I want to be able to browse through the movies currently playing
  So that I know what movies I am able to go see

  Background: movies is not a secure page
    Given I am not authenticated

  Scenario: User sees a list of movies on the movies page
    When I go to the Movies page
    Then I see a list of all movies now playing

  Scenario: User can visit the movies page from any page
    * I can visit the Movies page from any page
