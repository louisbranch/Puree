Feature: Creating a To Do Today List
  In order to defined today as a working day
  As an user
  I want to create a To Do Today List

  @javascript
  Scenario:
    Given I go to my activity inventory
    When I add a new To Do Today List
    Then I should see this to do list on the inventory
