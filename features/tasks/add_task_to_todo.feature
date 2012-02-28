Feature: Adding Tasks to my To Do Today List
  In order to select which tasks I intend to accomplish today
  As an user
  I want to add tasks to my To Do Today List

  @javascript @no-support
  Scenario:
    Given I have a to do today list
    And I have a task
    When I drag this task to this to do list
    Then I should see this task listed on this to do list
