Feature: web 1

  Scenario: try to login to github
  and then do a google search

    Given driver 'https://github.com/login'
    And input('#login_field', 'dummy')
    And input('#password', 'world')
    When submit().click("input[name=commit]")
    Then match html('.flash-error') contains 'Incorrect username or password.'
