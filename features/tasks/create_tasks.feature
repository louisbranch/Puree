Feature: Creating Tasks
  In order to have a list of tasks that I need to do
  As an user
  I want to add tasks to the Activity Inventory

  Scenario: Creating Tasks
    Given I go to my activity inventory
    When I create a new task
    Then I should see this new task listed on the inventory
