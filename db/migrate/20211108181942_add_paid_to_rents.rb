class AddPaidToRents < ActiveRecord::Migration[6.1]
  def change
    add_column :rents, :paid, :boolean, default: false
  end
end
