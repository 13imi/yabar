class Task < ActiveRecord::Base
  belongs_to :user
  has_many :todos

  default_scope -> { order('deadline ASC') }
  scope :day_before, ->(day) { where('deadline <= ?', day) }
  scope :day_after, ->(day) { where('deadline >= ?', day) }
end
