Given /^I go to my activity inventory$/ do
  visit root_path
end

Given /^two tasks exist$/ do
  @task1 = FactoryGirl.create(:task, :name => '1st Task')
  @task2 = FactoryGirl.create(:task, :name => '2nd Task')
end

When /^I create a new task$/ do
  fill_in 'task[name]', :with => 'Learn more about the Pomodoro Technique'
  click_on 'Create Task'
end

When /^I drag and drop the second task to the top of the first$/ do
  visit root_path
  task2 = find("li#task_#{@task2.id} i.handle")
  list = find("ol")
  task2.drag_to(list)
end

Then /^I should see this new task listed on the inventory$/ do
  page.should have_content 'Learn more about the Pomodoro Technique'
end

Then /^I should see these task sorted as second and first$/ do
  page.body.should =~ /#{'2nd Task'}.*#{'1st Task'}/m
end
