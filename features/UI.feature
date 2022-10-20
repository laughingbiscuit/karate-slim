Feature: UI
  Scenario: blah

* configure driverTarget = { docker: 'justinribeiro/chrome-headless', showDriverLog: true }

  Given driver 'https://google.com'
  And input('input[name=q]', 'karate dsl')

* screenshot()
