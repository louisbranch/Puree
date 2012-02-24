require 'spec_helper'

describe Task do

  let(:task) {FactoryGirl.build(:task)}

  context "validations" do
    it "requires a name" do
      task.name = nil
      task.should_not be_valid
      task.errors[:name].should include("can't be blank")
    end
  end

  context "position" do

    it "goes to 1st position when is the first Task" do
      task.save
      task.position.should eq(1)
    end

    it "goes to the last position when there is another task" do
      FactoryGirl.create(:task)
      task.save
      task.position.should eq(2)
    end

  context "pomodoros" do

    it "can be estimated when it is in a to do list and they haven't be estimated before" do
      task.todo_id = 1
      task.can_be_estimated?.should be_true
    end

    it "cannot be estimated when it is not a to do list" do
      task.can_be_estimated?.should be_false
    end

    it "cannot be estimated when it has been estimated before" do
      task.pomodoros = 1
      task.can_be_estimated?.should be_false
    end

    it "has its pomodoro erased when moved back to unassigned tasks" do
      task = FactoryGirl.create(:task, :todo_id => 1, :pomodoros => 5)
      task.update_attributes(:todo_id => nil)
      task.pomodoros.should eq(0)
    end

  end

  end

end
