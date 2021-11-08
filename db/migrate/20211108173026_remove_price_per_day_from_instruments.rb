class RemovePricePerDayFromInstruments < ActiveRecord::Migration[6.1]
  def change
    remove_column :instruments, :price_per_day, :integer
  end
end
