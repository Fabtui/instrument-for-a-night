class AddPricePerDayToInstruments < ActiveRecord::Migration[6.1]
  def change
    add_monetize :instruments, :price_per_day, currency: { present: false }
  end
end
