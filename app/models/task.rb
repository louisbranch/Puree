class Task < ActiveRecord::Base
  before_create :set_position

  validates :name, :presence => true

  default_scope :order => 'position ASC'

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
