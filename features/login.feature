@login
Feature: Login
  As a user in the web application
  Fernanda would like to enter the application
  To have access to all features

  Background:
    Given "Fernanda" is in the login screen

  @tags
  Scenario Outline: Try to login user with invalid credentials
    Given she fills the login fields with the following values
      | user     | <user_status>     |
      | password | <password_status> |
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
    Given "Fernanda" is in the log in screen
    When she logs in the application using valid credentials
    Then the browser screen should be displayed
