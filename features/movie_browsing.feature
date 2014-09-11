Feature: movie browsing
  As a Movietix visitor
  I want to be able to browse through the movies currently playing
  So that I know what movies I am able to go see

  Scenario Outline: User can visit the movies page from any page
    Given I can visit the Movies page from the <page_name> page

  Examples:
    | page_name |
    | login     |
    | theaters  |

  Scenario: User sees a list of movies on the movies page
    Given I visit the Movies page
    Then I can see a list of all movies now playing

  Scenario: Display movie details
    Given I view a movie's details
     Then I see the following:
    | theater list |
    | synopsis     |
    | rating       |
    | running time |