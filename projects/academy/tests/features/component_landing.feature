@login
Feature: Login
  As a user in the web application
  Fernanda would like to enter the application
  To have access to all features

  Background:
    Given "Fernanda" is in landing screen from application

  @tags
  Scenario: Validate the loading page after access the login screen
    When she clicks on the log in button
    Then the load screen should be displayed
    And the login screen should be displayed

  @tags
  Scenario: Validate the loading page after access the login screen
    When she clicks on the register button
    Then the load screen should be displayed
    And the register screen should be displayed

  @tags
  Scenario: Validate the frequent questions option
    When she clicks on the frequent questions button
    Then she should remain in the same screen
    And the screen focus should be on FAQ section
    And the FAQ option list should be displayed

  @tags
  Scenario: Validate the benefits option
    When she clicks on the benefits button
    Then she should remain in the same screen
    And the screen focus should be on Benefits section with the following fields
      | benefit list             |
      | create an account button |

  @tags
  Scenario: Validate the Google play option
    When she clicks on the Google play option
    Then the site to install/download the android application should be displayed in other tab

  @tags
  Scenario: Validate the App Store option
    When she clicks on the Google play option
    Then the site to install/download the ios application should be displayed in other tab
