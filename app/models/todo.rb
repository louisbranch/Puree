class Todo < ActiveRecord::Base
  has_many :tasks

  scope :all_with_tasks, includes(:tasks)

end
