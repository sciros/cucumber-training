Feature: movie browsing
  As a Movietix visitor
  I want to be able to browse through the movies currently playing
  So that I know what movies I am able to go see

  Scenario: User sees a list of movies on the movies page
    Given I visit the Movies page
    Then I can see a list of all movies now playing

  Scenario: User can visit the movies page from any page
    Given I can visit the Movies page from any page