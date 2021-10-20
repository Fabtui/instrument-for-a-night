class Instrument < ApplicationRecord
  belongs_to :instrument_type
  belongs_to :user
end
