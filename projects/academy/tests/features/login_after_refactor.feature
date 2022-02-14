@login
Feature: Login
  As a user in the web application
  Fernanda would like to enter the application
  To have access to all features

  Background:
    Given "Fernanda" is in the login screen

  @tags
  Scenario Outline: Try to login with invalid credentials
    Given he fills the user field with the "<user_status>" value
    And he fills the password field with the "<password_status>" value
    When she clicks on the login button
    Then the message about invalid credentials should be displayed

    Examples:
      | user_status          | password_status  |
      | invalid-user         | valid-password   |
      | registered           | invalid-password |
      | registered-phone     | invalid-password |
      | not-registered       | valid-password   |
      | not-registered-phone | valid-password   |
      | registered           | empty-input      |
      | empty-input          | valid-password   |
      | empty-input          | empty-input      |

  @tags
  Scenario: Valid login with email
    When she logs in the application using valid credentials
    Then the browser screen should be displayed
