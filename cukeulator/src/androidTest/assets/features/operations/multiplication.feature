Feature: Multiply two numbers
  Calculate the product of two numbers which consist of one or more digits

  Scenario Outline: Enter one digit per number and press =
    Given I have a CalculatorActivity
    When I press <num1>
    And I press x
    And I press <num2>
    And I press =
    Then I should see "<product>" on the display

  Examples:
    | num1 | num2 | product |
    | 0    | 0    | 0.0     |
    | 0    | 1    | 0.0     |
    | 1    | 2    | 2.0     |

  Scenario Outline: Enter two digits per number and press =
    Given I have a CalculatorActivity
    When I press <num1>
    When I press <num2>
    And I press x
    And I press <num3>
    And I press <num4>
    And I press =
    Then I should see "<product>" on the display

  Examples:
    | num1 | num2 | num3 | num4 | product |
    | 2    | 2    | 2    | 2    | 484.0   |
    | 2    | 0    | 1    | 0    | 200.0   |

  @retry
  Scenario Outline: Scenario flaky
    Given I have a CalculatorActivity
    When I press <num1>
    And I press x
    And I press <num2>
    And I press =
    Then random fail
    Examples:
      | num1 | num2 |
      | 0    | 0    |
      | 0    | 1    |
      | 0    | 2    |

  @retry
  Scenario: Scenario simple
    Given I have a CalculatorActivity
    When I press 6
    And I press x
    And I press 7
    And I press =
    Then I should see "42.0" on the display
