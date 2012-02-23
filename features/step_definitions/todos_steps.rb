Given /^I have a to do today list$/ do
  @todo = FactoryGirl.create(:todo)
end

When /^I add a new To Do Today List$/ do
  click_on 'Create To Do Today List'
end

Then /^I should see this to do list on the inventory$/ do
  page.should have_content "To Do for #{Time.now.strftime('%d %b %Y')}"
end
