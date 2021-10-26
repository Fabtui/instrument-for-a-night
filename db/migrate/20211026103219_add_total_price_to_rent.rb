class AddTotalPriceToRent < ActiveRecord::Migration[6.1]
  def change
    add_column :rents, :total_price, :integer
  end
end
