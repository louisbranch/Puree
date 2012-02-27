Feature: Starting a Pomodoro
  In order to mark the beginning of my work
  As an user
  I want to start a Pomodoro

  @javascript
  Scenario:
    Given I have a task with a pomodoro on a todo list
    When I start this pomodoro
    Then I should start my work iteration
