class CreateRents < ActiveRecord::Migration[6.1]
  def change
    create_table :rents do |t|
      t.date :start_time
      t.date :end_time
      t.references :user
      t.references :instrument

      t.timestamps
    end
  end
end
