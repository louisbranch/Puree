class Task < ActiveRecord::Base
  before_create :set_position
  before_update :erase_pomodoros

  belongs_to :todo

  validates :name, :presence => true

  default_scope :order => 'position ASC'
  scope :unassigned, where(:todo_id => nil)

  def self.sort(tasks, todo)
    tasks.each_with_index do |id, index|
      if todo
        Task.update_all({todo_id: todo, position: (index+1)},{id: id})
      else
        Task.update_all({todo_id: nil, position: (index+1), pomodoros: 0},{id: id})
      end
    end
  end

  def can_be_estimated?
    todo_id && pomodoros == 0
  end

  private

  def set_position
    if Task.last
      last_position = Task.last.position
      self.position = last_position + 1
    else
      self.position = 1
    end
  end

  def erase_pomodoros
    unless todo_id
      self.pomodoros = 0
    end
  end

end
