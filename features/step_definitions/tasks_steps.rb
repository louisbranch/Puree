Given /^I go to my activity inventory$/ do
  visit root_path
end

When /^I create a new task$/ do
  fill_in 'task[name]', :with => 'Learn more about the Pomodoro Technique'
  click_on 'Create Task'
end

Then /^I should see this new task listed on the inventory$/ do
  page.should have_content 'Learn more about the Pomodoro Technique'
end
