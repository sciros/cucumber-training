@exercise
Feature: theater browsing
  As a Movietix visitor
  I want to be able to browse through the theaters in town
  So that I know what theaters I can visit

  Background: theaters is not a secure page
    Given I am not logged in

  Scenario: User can visit the theaters page from any page
    * I can visit the Theaters page from any page
