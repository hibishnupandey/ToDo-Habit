Feature: Home page

  Scenario: Viewing application's home page
    Given user visit home page
    Then user should see a message "Welcome to"
    And user should see the "Sign Up" and "Sign In"