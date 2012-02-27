Given /^I have a to do today list$/ do
  @todo = FactoryGirl.create(:todo)
end

When /^I add a new To Do Today List$/ do
  click_on 'New'
end

Then /^I should see this to do list on the inventory$/ do
  page.should have_content 'To Do for'
end
