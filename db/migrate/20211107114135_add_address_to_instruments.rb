class AddAddressToInstruments < ActiveRecord::Migration[6.1]
  def change
    add_column :instruments, :address, :text
  end
end
