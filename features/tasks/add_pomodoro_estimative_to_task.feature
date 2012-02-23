Feature: Adding Pomodoro Estimative to Task
  In order to estimate how many pomodoros I need to finish a task
  As an user
  I want to add a number of estimated pomodoros for a task

  @javascript
  Scenario:
    Given I have a task on my to do today list
    When I add a number of estimated pomodoros to this task
    Then I should see how many pomodoros this task will last
