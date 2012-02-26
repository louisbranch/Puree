class Task < ActiveRecord::Base
  before_create :set_position

  belongs_to :todo
  has_many :pomodoros

  validates :name, :presence => true

  default_scope :order => 'position ASC'
  scope :unassigned, where(:todo_id => nil).includes(:pomodoros)

  def self.sort(tasks, todo)
    tasks.each_with_index do |id, index|
      Task.update_all({todo_id: todo, position: (index+1)},{id: id})
    end
  end

  def can_be_estimated?
    !todo_id.nil? && pomodoros.empty?
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

end
