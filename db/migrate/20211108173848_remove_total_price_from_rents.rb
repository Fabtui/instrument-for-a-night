class RemoveTotalPriceFromRents < ActiveRecord::Migration[6.1]
  def change
    remove_column :rents, :total_price, :integer
  end
end
