Feature: authentication
  As the Movietix product owner
  I want visitors to authenticate prior to purchasing tickets
  So that visitors have a personalized user experience and so that I can track visitor behavior

  Background: user is not logged in
    Given I am not logged in

  Scenario: user goes directly to the login page and authenticates with valid credentials
    Given I go to the login page
    When I enter "user1" into the username
    And I enter "P4ssw0rd" into the password
    And I press the login button
    Then I am logged in
    And I am on the account page

  Scenario: user tries to authenticate with invalid credentials
    Given I go to the login page
    When I enter "user1" into the username
    And I enter "bad password" into the password
    And I press the login button
    Then I see an authentication error message
    And I am on the login page
