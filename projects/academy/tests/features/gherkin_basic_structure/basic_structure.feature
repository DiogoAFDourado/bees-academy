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
  Scenario: Name
    Given ...
    When ...
    Then ...

  @tags
  Scenario Outline: Name
    Given ...
    When ... "<title_1>"
    Then ..."<title_2>"

    Examples:
      | title_1 | title_2 |
      | value   | value   |

  @tags
  Scenario: Name
    Given ...
    When ...
    Then the following fields should be displayed
      | names   |
      | field 1 |
      | field 2 |

  @tags
  Scenario: Name
    Given she fills the following fields with valid values
      | names   |
      | field 1 |
      | field 2 |
    When ...
    Then ...
