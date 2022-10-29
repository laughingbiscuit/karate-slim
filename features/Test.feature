Feature: call an API

  Scenario: Successfully call API
    Given url 'https://httpbin.org/get'
    And header x-test = true
    When method get
    Then status 200

  Scenario: Store a variable between two scenarios
    Given url 'https://httpbin.org/get'
    And header Access-Token = 'abcdef'
    When method get
    Then status 200
    And def token = $.headers.Access-Token
    And print token
    Given url 'https://httpbin.org/get'
    And def authHeader = 'Bearer ' + token
    And header Authorization = authHeader
    When method get
    Then status 200

