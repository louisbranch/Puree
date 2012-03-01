Given /^I go to my activity inventory$/ do
  visit root_path
end

Given /^I have a task$/ do
  @task = FactoryGirl.create(:task)
end

Given /^two tasks exist$/ do
  @task1 = FactoryGirl.create(:task, :name => '1st Task')
  @task2 = FactoryGirl.create(:task, :name => '2nd Task')
end

Given /^I have a task on my to do today list$/ do
  @todo = FactoryGirl.create(:todo)
  @task = FactoryGirl.create(:task, :todo => @todo)
end

When /^I create a new task$/ do
  fill_in 'task[name]', :with => 'Learn more about the Pomodoro Technique'
  click_on 'Create Task'
end

When /^I drag and drop the second task to the top of the first$/ do
  visit root_path
  task2 = find("li#task_#{@task2.id}")
  list = find("ol.unassigned_tasks")
  task2.drag_to(list)
end

When /^I drag this task to this to do list$/ do
  visit root_path
  task = find("li#task_#{@task.id}")
  list = find("li#todo_#{@todo.id} ol.todo_tasks")
  task.drag_to(list)
end

When /^I add a number of estimated pomodoros to this task$/ do
  visit root_path
  find('label', :text => '3 Pomodoros').click
end

Then /^I should see this new task listed on the inventory$/ do
  page.should have_content 'Learn more about the Pomodoro Technique'
end

Then /^I should see these task sorted as second and first$/ do
  visit root_path
  page.body.should =~ /#{'2nd Task'}.*#{'1st Task'}/m
end

Then /^I should see this task listed on this to do list$/ do
  visit root_path
  within("li#todo_#{@todo.id}") do
    page.should have_content @task.name
  end
end

Then /^I should see how many pomodoros this task will last$/ do
  visit root_path
  page.should have_css("img[title='#3 Pomodoro']")
end
