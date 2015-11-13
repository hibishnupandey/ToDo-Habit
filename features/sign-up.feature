Feature: Sign Up

  Scenario: User registration
    Given user is on the home page
    Then user can see a link "Sign Up"
    When user click on link "Sign Up"
    And user fill in "user email" with "bishnu@gmail.com"
    And user fill in "user password" with "welcome1"
    And user fill in "user password_confirmation" with "welcome1"
    And user click the "Sign up" button
    Then user should be redirected to the dashboard page
    And user see message "Welcome to"