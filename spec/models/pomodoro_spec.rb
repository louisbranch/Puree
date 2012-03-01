require 'spec_helper'

describe Pomodoro do

  context "validation" do

    it "needs to belong to a task" do
      pomodoro = FactoryGirl.build(:pomodoro, :task => nil)
      pomodoro.should_not be_valid
      pomodoro.errors[:task].should include("can't be blank")
    end

    it "default duration is 25 minutes" do
      pomodoro = FactoryGirl.create(:pomodoro)
      pomodoro.duration.should eq(25)
    end

  end

  it "is finished when all pomodoros are finished" do
    FactoryGirl.create(:pomodoro, :finished => true)
    Pomodoro.should be_all_finished
  end

  it "is not finished when at least one pomodoro is not finished" do
    FactoryGirl.create(:pomodoro, :finished => false)
    Pomodoro.should_not be_all_finished
  end

  it "has next pomodoro when at least one pomodoro is not finished" do
    pomodoro = FactoryGirl.create(:pomodoro, :finished => false)
    Pomodoro.next.should eq(pomodoro)
  end

  it "starts and finish after 25 minutes" do
    Delayed::Worker.delay_jobs = false
    pomodoro = FactoryGirl.create(:pomodoro, :finished => false)
    pomodoro.start
    pomodoro.started_at.should_not be_nil
    pomodoro.finished_at.should_not be_nil
    pomodoro.should be_finished
  end

  it "has a remaining time in seconds" do
    pomodoro = FactoryGirl.create(:pomodoro, :started_at => 5.minutes.ago)
    pomodoro.timeleft.should eq(1200)
  end

  it "is ongoing while the timer isn't finished" do
    pomodoro = FactoryGirl.create(:pomodoro, :started_at => 20.minutes.ago)
    pomodoro.should be_ongoing
  end

end
