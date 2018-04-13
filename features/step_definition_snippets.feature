Feature: step definition snippets

  Scenario: numbers
    Given a file named "features/number.feature" with:
      """
      Feature: a feature
        Scenario: a scenario
          Given a step numbered 5
      """
    When I run cucumber-js
    Then it fails
    And the output contains the text:
      """
      Given('a step numbered {int}', function (int1) {
        // Write code here that turns the phrase above into concrete actions
        return 'pending';
      });
      """

  Scenario: quoted strings
    Given a file named "features/number.feature" with:
      """
      Feature: a feature
        Scenario: a scenario
          Given a step with "quotes"
      """
    When I run cucumber-js
    Then it fails
    And the output contains the text:
      """
      Given('a step with {string}', function (string1) {
        // Write code here that turns the phrase above into concrete actions
        return 'pending';
      });
      """

  Scenario: multiple quoted strings
    Given a file named "features/number.feature" with:
      """
      Feature: a feature
        Scenario: a scenario
          Given a step with "quotes" and "more quotes"
      """
    When I run cucumber-js
    Then it fails
    And the output contains the text:
      """
      Given('a step with {string} and {string}', function (string1, string2) {
        // Write code here that turns the phrase above into concrete actions
        return 'pending';
      });
      """

  Scenario: background step
    Given a file named "features/background.feature" with:
      """
      Feature: a feature
        Background:
          Given a step with "quotes"
        Scenario: a scenario
          Given a passing step
      """
    When I run cucumber-js
    Then it fails
    And the output contains the text:
      """
      Given('a step with {string}', function (string1) {
        // Write code here that turns the phrase above into concrete actions
        return 'pending';
      });
      """
