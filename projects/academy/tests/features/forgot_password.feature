@forgot_password
Feature: Forgot Password
  As a registered user in the app
  Julia would like to change his password
  To make your account safer

  Background:
    Given "Fernanda" is logged in to the application

  @tags_1
  Scenario: Login after recovering password by token using email
    Given she recovered her password by email
    And she logs out of the application through home
    When she logs into the application with the password recovered
    Then she must be successfully logged in

  @tags_2
  Scenario Outline: Outline
    Given she recovered her password by email "<test>"
    And she logs out of the application through home
    When she logs into the application with the password recovered
    Then she must be successfully logged in

    Examples:
      | test |
      | 1    |
      | 2    |

  @skip
  Scenario: Skip
    Given she recovered her password by email
    And she logs out of the application through home
    When she logs into the application with the password recovered
    Then she must be successfully logged in
