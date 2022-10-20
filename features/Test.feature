Feature: call an API

  Scenario: Successfully call API
    Given url 'https://httpbin.org/get'
    And header x-test = true
    When method get
    Then status 200
