require 'spec_helper.rb'

describe Task do

  it "requires a name" do
    task = Task.new
    task.should_not be_valid
    task.errors[:name].should include("can't be blank")
  end

end
