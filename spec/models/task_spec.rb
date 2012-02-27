require 'spec_helper'

describe Task do

  let(:task) { FactoryGirl.build(:task) }

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

  end

  context "pomodoros" do

    let(:task) { FactoryGirl.build(:task, :todo_id => 1) }

    it "can be estimated when it is in a to do list and its hasn't been estimated before" do
      task.can_be_estimated?.should be_true
    end

    it "cannot be estimated when it is not in a to do list" do
      task.todo_id = nil
      task.can_be_estimated?.should be_false
    end

    it "cannot be estimated when it has been estimated before" do
      FactoryGirl.create(:pomodoro, :task => task)
      task.can_be_estimated?.should be_false
    end

    it "is ongoing while all its pomodoros aren't finished" do
      FactoryGirl.create(:pomodoro, :task => task)
      task.should be_ongoing
    end

    it "is not ongoing when it doesn't have any pomodoros" do
      task.should_not be_ongoing
    end

    it "is not ongoing when its pomodoros are finished" do
      FactoryGirl.create(:pomodoro, :task => task, :finished => true)
      task.should_not be_ongoing
    end

  end

  context "sorting" do

    it "updates its to do list and position" do
      task = FactoryGirl.create(:task)
      Task.sort(['99',task.id],1)
      task.reload
      task.position.should eq(2)
      task.todo_id.should eq(1)
    end

  end

end
