InstrumentType.destroy_all

instrument_types = %w(Guitar Bass Drum Acoustic\ Guitar)

instrument_types.each do |instrument_type|
  InstrumentType.create!(instrument_type: instrument_type)
end
