@forgot_password
Feature: Forgot Password
  As a registered user in the app
  Julia would like to change his password
  To make your account safer

  Background:
    Given that Fernanda as an ADM user is in the login screen

  @tags
  Scenario: Login after recovering password by token using email
    Given she recovered his password by email
    And she logs out of the application through home
    When she logs into the application with the password recovered
    Then she must be successfully logged in
