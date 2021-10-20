User.destroy_all
Instrument.destroy_all

User.create!(
  email: "toto@mail.com",
  password: "azerty",
  nickname: "Toto",
  location: "16 Rue de la république, 69002 Lyon"
)

Instrument.create!(
  instrument_type: "Electric Guitar",
  user_id: 1,
  brand: "Fender",
  name: "Stratocaster Clapton Custom Shop",
  year: 1992,
  price_per_day: 150,
  description: "Experience the peerless Strat® style of Slowhand himself with the Eric Clapton Stratocaster, one of our most acclaimed and enduring artist signature models. With classic design and special features that give it exceptional tonal versatility and effortless feel worthy of one of the world's greatest names in rock and blues, it puts pure Clapton Stratocaster tone and feel straight into your hands.",
  for_rent: true
)

puts "#{User.count} Users created"
puts "#{Instrument.count} Instrumentss created"
