Feature: UI
  Scenario: blah

* configure driver = { type: 'chrome' }

  Given driver 'https://google.com'
  And input('input[name=q]', 'karate dsl')

* screenshot()
