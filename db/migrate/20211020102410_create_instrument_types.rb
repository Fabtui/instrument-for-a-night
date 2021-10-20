class CreateInstrumentTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :instrument_types do |t|
      t.string :instrument_type

      t.timestamps
    end
  end
end
