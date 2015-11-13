Feature: Sign In

  Scenario: User Login
    Given a valid user
    And visitor is on the home page
    When visitor click on link "Sign In"
    And visitor fill in "user email" with "test@hotmail.com"
    And visitor fill in "user password" with "welcome1"
    When visitor click the "Sign in" button
    Then visitor should be redirected to the dashboard page
    And visitor see message "Welcome to"