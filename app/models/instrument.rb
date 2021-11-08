class Instrument < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  has_many :rents
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  monetize :price_per_day_cents

  include PgSearch::Model
  pg_search_scope :global_search,
                  against: %i[name description brand year],
                  using: { tsearch: { prefix: true } }

  pg_search_scope :type_search,
                  against: [:instrument_type]

  pg_search_scope :location_search,
                  associated_against: {
                    user: [:location]
                  },
                  using: {
                    tsearch: { prefix: true }
                  }
end
