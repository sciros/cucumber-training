Feature: authentication
  As the Movietix product owner
  I want visitors to authenticate prior to purchasing tickets
  So that visitors have a personalized user experience and so that I can track visitor behavior

  Scenario: user goes directly to the login page and authenticates with valid credentials
     Given I can log in with valid credentials
      Then I can log out

  Scenario: user tries to authenticate with invalid credentials
    Given I try to log in with invalid credentials
    Then I see an authentication error message