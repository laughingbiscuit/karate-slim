Feature: call an API

  Scenario: Successfully call API
    Given url 'https://httpbin.org/get'
    And header x-test = true
    When method get
    Then status 200

  Scenario: Store a variable between two scenarios
    Given url 'https://httpbin.org/get'
    And header Access-token = 'abcdef'
    When method get
    Then status 200
    And def token = response.headers.Access-token
    And print token

  Scenario: Successfully call API
    Given url 'https://httpbin.org/get'
    And def authHeader = 'Bearer ' + token
    And header Authorization = authHeader
    When method get
    Then status 200

