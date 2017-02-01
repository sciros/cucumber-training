Feature: authentication
  As the Movietix product owner
  I want visitors to authenticate prior to purchasing tickets
  So that visitors have a personalized user experience and so that I can track visitor behavior

  Background: user is not logged in
    Given I am not logged in

  Scenario: user goes directly to the login page and authenticates with valid credentials
     When I successfully log in with valid credentials
     Then I am on the account page
    #might want to remove the above step... it only works when this is the first scenario run.

  Scenario: user tries to authenticate with invalid credentials
     When I try to log in with invalid credentials
     Then I see an authentication error message
      And I am on the login page
