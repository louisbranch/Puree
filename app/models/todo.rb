class Todo < ActiveRecord::Base
  has_many :tasks

  def self.all_with_tasks
    includes(:tasks)
  end

end
