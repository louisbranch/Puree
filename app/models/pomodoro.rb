class Pomodoro < ActiveRecord::Base
  belongs_to :task

  def self.mass_create(task_id, quantity)
    Pomodoro.transaction do
      quantity.times{ create(:task_id => task_id) }
    end
  end

end
