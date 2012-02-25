class Todo < ActiveRecord::Base
  has_many :tasks

  default_scope :order => 'created_at DESC'

  scope :all_with_tasks, includes(:tasks)

end
