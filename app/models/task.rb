class Task < ActiveRecord::Base
  belongs_to :user
  has_many :todos

  default_scope -> { order('deadline ASC') }
  scope :day_before, ->(day) { where('deadline <= ?', day) }
  scope :day_after, ->(day) { where('deadline >= ?', day) }

  def self.search_duration(start_day, end_day)
    select { |task| (start_day < (task.deadline - (2 ** task.yabasa).days)) && ((task.deadline - (2 ** task.yabasa).days) < end_day) }
  end
end
