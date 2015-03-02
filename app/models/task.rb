class Task < ActiveRecord::Base
  belongs_to :user
  has_many :todos

  default_scope -> { order('deadline ASC') }
  scope :day_before, ->(day) { where('deadline <= ?', day) }
  scope :day_after, ->(day) { where('deadline >= ?', day) }

  def self.search_duration(start_day, end_day)
    range = start_day..end_day
    include_deadline = select { |task| range.cover? task.deadline }
    include_duration = select { |task| range.cover? task.duration }
    in_duration = select { |task| task.duration <  start_day && end_day < task.deadline }
    (include_duration + include_deadline + in_duration).uniq.sort_by { |task| task.duration }
    # select { |task| (start_day < (task.deadline - (2 ** task.yabasa).days)) && ((task.deadline - (2 ** task.yabasa).days) < end_day) }
    # select { |task| (start_day < task.deadline && ((task.deadline - (2 ** task.yabasa).days) < end_day }
  end

  def duration
    deadline - (2 ** yabasa).days
  end
end
