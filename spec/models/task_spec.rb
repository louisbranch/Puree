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

  end

end
