Feature: Name
  Description (3 lines)
  First: As a user ......, ex: As an admin user, As a user, As a seller ….
  Second: <Actor name> would like..., answer the question! What does the user want to do?
  Third: To... →answer the question: Why does the user want to do this?

  Background:
    Given ...

  # """
  # Dado que a "Feature" tenha um início comum entre todos os cenários,
  # fique a vontade de incluí-lo aqui, caso contrario,
  # deixe-o dentro do cenário.
  # """
  @tags
  # Without space between Scenario: our Scenario Outline: and Name
  Scenario: Name
    Given ...
    When ...
    Then ...

  @tags
  # Starting the scenario with And is not allowed, even when the Feature contains Background:
  Scenario: Name
    And ...
    When ...
    Then ...

  @tags
  # Variable table is not supported by Pytest-BDD
  Scenario Outline: Name
    Given she fills the following fields with valid values
      | field 1 | <value_of_field_1> |
      | field 2 | <value_of_field_2> |
    When ... "<title_1>"
    Then ..."<title_2>"

    Examples:
      | value_of_field_1 | value_of_field_2 |
      | value            | value            |
      | value            | value            |
      | value            | value            |

  # Tags by Examples:, it is not supported by Pytest-BDD
  Scenario Outline: Name
    Given ...
    When ... "<title_1>"
    Then ..."<title_2>"

    @tag_1
    Examples:
      | title_1 | title_2 |
      | value   | value   |
      | value   | value   |
      | value   | value   |

    @tag_2
    Examples:
      | title_1 | title_2 |
      | value   | value   |
      | value   | value   |
      | value   | value   |
