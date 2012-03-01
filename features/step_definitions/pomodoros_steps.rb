Given /^I have a task with a pomodoro on a todo list$/ do
  todo = FactoryGirl.create(:todo)
  @task = FactoryGirl.create(:task, :todo => todo)
  pomodoro = FactoryGirl.create(:pomodoro, :task => @task)
end

When /^I start this pomodoro$/ do
  visit root_path
  click_on 'Start'
end

Then /^I should start my work iteration$/ do
  page.should have_content "Pomodoro was started"
  page.should have_content "Pomodoro in Progress"
  page.should have_content "Task: #{@task.name}"
  page.should have_content "Time left: 29:"
end
