Feature: UI
  Scenario: blah
    * configure driver = { type: 'chrome', showDriverLog: true }
    Given driver 'https://google.com'
    And input('input[name=q]', 'karate dsl')
    Then screenshot()
