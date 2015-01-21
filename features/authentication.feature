Feature: authentication
  As the Movietix product owner
  I want visitors to authenticate prior to purchasing tickets
  So that visitors have a personalized user experience and so that I can track visitor behavior

  Scenario: user goes directly to the login page and authenticates with valid credentials
    Given I go to the login page
    When I enter "user1" into the username
    And I enter "P4ssw0rd" into the password
    And I press the login button
    Then I am logged in
    And I am on the movies page
    When I click the logout link
    Then I am on the movies page
    And I am not logged in

  Scenario: user tries to authenticate with invalid credentials
    Given I go to the login page
    When I enter "user1" into the username
    And I enter "bad password" into the password
    And I press the login button
    Then I see "Sorry"
    And I am on the login page
    And I am not logged in