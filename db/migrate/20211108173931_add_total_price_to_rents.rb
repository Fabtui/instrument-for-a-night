class AddTotalPriceToRents < ActiveRecord::Migration[6.1]
  def change
    add_monetize :rents, :total_price, currency: { present: false }
  end
end
