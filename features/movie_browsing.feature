Feature: movie browsing
  As a Movietix visitor
  I want to be able to browse through the movies currently playing
  So that I know what movies I am able to go see

  Background: movies is not a secure page
    Given I am not authenticated

  Scenario: User can visit the movies page from any page
    * I can visit the Movies page from any page

  @exercise # outline
  Scenario Outline: visiting movies from any page (outline)
    * I can visit the movies page from the <page_name> page

    Examples:
      | page_name |
      | Theaters  |
      | Login     |

  @exercise # with table
  Scenario: visiting movies from any page (table)
    * I can visit the movies page from these pages:
      | Theaters |
      | Login    |