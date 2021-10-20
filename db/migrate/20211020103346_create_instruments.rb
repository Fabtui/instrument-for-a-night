class CreateInstruments < ActiveRecord::Migration[6.1]
  def change
    create_table :instruments do |t|
      t.references :instrument_type, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :brand
      t.string :description
      t.integer :year
      t.integer :price_per_day
      t.boolean :for_rent, default: false

      t.timestamps
    end
  end
end
