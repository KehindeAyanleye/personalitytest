Feature: Test results
  In order to learn about personality type
  As a visitor
  I want to be able to take a test

  Scenario: Taking test successfully
    Given I'm on the home page
    When I answer all the questions
    Then I should be told my personality type

  Scenario: Missing answers
    Given I'm on the home page
    When I answer all but one of the questions
    Then I should be told which questions I've skipped