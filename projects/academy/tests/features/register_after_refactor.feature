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
    And he accesses the create password screen through register flow
    When he tries to create the password with the following value "<password>"
    Then an error message about password roles should be displayed

    Examples:
      | password    |
      | 09090909    |
      | abZaZXr     |
      | abcdecghijk |
      |             |

  # Variable table is not supported by Pytest-BDD
  Scenario Outline: Try register using invalid Account Number + invalid Liquor License Number
    Given the user is in the register flow
    And he accesses the register POC screen by register flow
    And he fills the following fields with the following values
      | account_number        | <account_number>        |
      | liquor_license_number | <liquor_license_number> |
    When he triggers the register page continue option
    Then the error message should be displayed

    @tag-ALL
    Examples:
      | account_number | liquor_license_number |
      | invalid        | invalid               |
      | invalid        | valid                 |
      | valid          | invalid               |
      | empty          | valid                 |
      | valid          | empty                 |
      | not-registered | valid                 |

    @tags-BR
    Examples:
      | account_number      | liquor_license_number |
      | cpf-not-registered  | cpf-not-registered    |
      | invalid             | invalid               |
      | cnpj-not-registered | cnpj-not-registered   |
      | empty               | empty                 |

  @tags-US
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

  @tags
  # Gherkin imperativo, como foco em COMO deve ser feito e não no QUE deveria ser feito!
  # And he accesses the create password screen through register flow
  Scenario: Registration successful - IAM
    Given the user is in the register screen
    And he fills email field with valid value
    And he clicks on email continue button
    And he fills the token field with valid value
    And he clicks on token continue button
    And he fills the name and ninkname with valid values
    And he clicks on name and ninkname continue button
    And he fills the password field with valid value
    And he clicks on password continue button
    When he finishes the register filling the POC info
    Then the browser screen should be displayed
