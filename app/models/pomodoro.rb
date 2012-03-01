class Pomodoro < ActiveRecord::Base
  belongs_to :task

  validates :task, :presence => true

  def self.mass_create(task_id, quantity)
    Pomodoro.transaction do
      quantity.times{ create(:task_id => task_id) }
    end
  end

  def self.all_finished?
    where(:finished => false).empty?
  end

  def self.next
    where(:finished => false).first
  end

  def self.ongoing
    where("started_at IS NOT NULL AND finished = ?", false).first
  end

  def start
    self.started_at = Time.now
    self.save
    finish
  end

  def ongoing?
    !started_at.nil? && !finished?
  end

  def timeleft
    seconds = (started_at + duration.minutes) - Time.now
    seconds.round
  end

  def image
    if finished
      '/assets/tomato_finished_small.png'
    else
      '/assets/tomato_normal_small.png'
    end
  end

  private

  def finish
    self.finished = true
    self.finished_at = Time.now
    self.save
  end
  handle_asynchronously :finish, :run_at => Proc.new { 25.minutes.from_now }

end
