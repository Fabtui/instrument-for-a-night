class Instrument < ApplicationRecord
  belongs_to :user
  has_many_attached :photos

  include PgSearch::Model
  pg_search_scope :global_search,
                  against: %i[name description brand year],
                  using: { tsearch: { prefix: true } }

  pg_search_scope :type_search,
                  against: [:instrument_type],
                  using: { tsearch: { prefix: true, any_word: true } }

  pg_search_scope :location_search,
                  associated_against: {
                    user: [:location]
                  },
                  using: {
                    tsearch: { prefix: true }
                  }
end
