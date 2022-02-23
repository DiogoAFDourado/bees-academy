@register
Feature: Register
  As an user in the app
  Marcos would like sign up in the application
  To manage his purchases

  @tags
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

  Scenario Outline: Try register using invalid Account Number + invalid Liquor License Number
    Given the user is in the register flow
    And he accesses the register POC screen by register flow
    And he fills the account number with the following value "<account_number>"
    And he fills the account number with the following value "<liquor_license_number>"
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

  @tags
  Scenario: Registration successful - IAM
    Given the user is in the register screen
    And he accesses the create password screen through register flow
    When he finishes the register filling the POC info
    Then the browser screen should be displayed
