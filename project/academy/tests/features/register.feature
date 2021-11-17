@register
Feature: Register
  As an user in the app
  Marcos would like sign up in the application
  To manage his purchases

  @tags
  # Gherkin imperativo, como foco em COMO deve ser feito e não no QUE deveria ser feito!
  # And he accesses the create password screen through register flow
  Scenario Outline: Try register with password outside of security standards
    Given the user is in the register screen
    And he fills email field with valid value
    And he clicks on continue button
    And he fills the token field with valid value
    And he clicks on continue button
    And he fills the name and ninkname with valid values
    And he clicks on continue button
    When he tries to create the password with the following value "<password>"
    Then an error message about password roles should be displayed

    Examples:
      | password    |
      | 09090909    |
      | abZaZXr     |
      | abcdecghijk |
      |             |

  @tags
  Scenario Outline: Try register using invalid Account Number + invalid Liquor License Number
    Given the user is in the register flow
    And access the register POC screen
    And fill the field(s) with "<account_number>"
    And fill the field(s) with "<liquor_license_number>"
    When trigger the register page continue option
    Then the error message should be displayed

    Examples:
      | account_number | liquor_license_number |
      | invalid        | invalid               |
      | invalid        | valid                 |
      | valid          | invalid               |
      | empty          | valid                 |
      | valid          | empty                 |
      | not-registered | valid                 |

  @tags
  Scenario Outline: Try register using invalid Account Number + invalid Liquor License Number - BR
    Given the user is in the register flow
    And access the register POC screen
    And fill the field(s) with "<account_number>"
    And fill the field(s) with "<liquor_license_number>"
    When trigger the register page continue option
    Then the error message should be displayed

    Examples:
      | account_number      | liquor_license_number |
      | cpf-not-registered  | cpf-not-registered    |
      | invalid             | invalid               |
      | cnpj-not-registered | cnpj-not-registered   |
      | empty               | empty                 |

  @tags
  Scenario Outline: Try register using invalid Account Number + invalid Liquor License Number - MX
    Given the user is in the register flow
    And access the register POC screen
    And fill the field(s) with "<account_number>"
    When trigger the register page continue option
    Then the error message should be displayed

    Examples:
      | account_number |
      | invalid        |
      | empty          |
      | not-registered |

  @tags
  Scenario Outline: Try register using invalid Account Number + invalid Liquor License Number - US
    Given the user is in the register flow
    And access the register POC screen
    And fill the field(s) with "<account_number>"
    And fill the field(s) with "<liquor_license_number>"
    And fill the field(s) with "<zip_code>"
    When trigger the register page continue option
    Then the error message should be displayed

    Examples:
      | account_number | liquor_license_number | zip_code       |
      | invalid        | invalid               | invalid        |
      | invalid        | valid                 | invalid        |
      | valid          | invalid               | invalid        |
      | invalid        | invalid               | valid          |
      | empty          | valid                 | empty          |
      | valid          | empty                 | empty          |
      | empty          | empty                 | valid          |
      | empty          | empty                 | empty          |
      | not-registered | valid                 | not-registered |
      | not-registered | not-registered        | valid          |
      | valid          | not-registered        | not-registered |

  # Android is failing due to the issue @bug-BEESMA-20897
  @tags
  Scenario Outline: Try register using invalid token
    Given the user is in the register screen
    And she accesses the token screen
    When she tries to access the personal info screen using the value "<value>"
    Then a error message about the "<value>" token field should be displayed

    Examples:
      | value         |
      | empty         |
      | less-than-six |
      | more-than-six |

  @tags
  Scenario Outline: Try register using invalid Email
    Given the user is in the register screen
    When he fills the email fields with a "<value>"
    Then an error message about the "<value>" should be displayed

    Examples:
      | value      |
      | registered |
      | invalid    |
      | empty      |

  @tags
  Scenario Outline: Try register using invalid Phone Number
    Given the user is in the register screen
    When he fills the phone fields with a "<value>"
    Then an error message about the "<value>" phone should be displayed

    # TODO: There are no phones registered for the zones
    Examples:
      | value   |
      # | registered |
      | invalid |
      | empty   |

  # Android is failing due to the issue @bug-BEESMA-20897
  @tags
  Scenario: Registration successful - IAM
    Given the user is in the register screen
    When he filled all information to register an account
    And he associates the created account with a poc
    Then he can see the Browse screen
