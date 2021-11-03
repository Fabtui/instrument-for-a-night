class Rent < ApplicationRecord
  belongs_to :instrument
  belongs_to :user

  validates :start_time, presence: true
  validates :end_time, presence: true
end
