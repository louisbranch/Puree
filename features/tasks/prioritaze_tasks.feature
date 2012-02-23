Feature: Prioritizing Tasks
  In order to organize which tasks are more important
  As an user
  I want to prioritize each task in the list

  # Cannot test jQuery sortable on the same list with Capybara
  @javascript @no-support
  Scenario: Dragging and dropping tasks
		Given two tasks exist
		When I drag and drop the second task to the top of the first
		Then I should see these task sorted as second and first
