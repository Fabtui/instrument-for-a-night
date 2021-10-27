require "open-uri"

User.destroy_all
Instrument.destroy_all

user = User.create!(
  email: "toto@mail.com",
  password: "azerty",
  nickname: "Toto",
  location: "16 Rue de la république, 69002 Lyon"
)
user.avatar.attach(io: File.open('app/assets/images/profile-pic.jpg'), filename: 'profile-pic.jpg', content_type:'image/jpg')

user2 = User.create!(
  email: "chuck@mail.com",
  password: "azerty",
  nickname: "Chuck",
  location: "8, avenue Dutuit – 75008 Paris"
)
user2.avatar.attach(io: File.open('app/assets/images/chuck-norris-mulet.jpg'), filename: 'chuck-pic.jpg', content_type:'image/jpg')

clapton = Instrument.create!(
  instrument_type: "Electric Guitar",
  user_id: 1,
  brand: "Fender",
  name: "Stratocaster Clapton Custom Shop",
  year: 1992,
  price_per_day: 150,
  description: "Experience the peerless Strat® style of Slowhand himself with the Eric Clapton Stratocaster, one of our most acclaimed and enduring artist signature models. With classic design and special features that give it exceptional tonal versatility and effortless feel worthy of one of the world's greatest names in rock and blues, it puts pure Clapton Stratocaster tone and feel straight into your hands.",
  for_rent: true
)
clapton.photos.attach(io: File.open('app/assets/images/custom-shop-eric-clapton-signature-strat-ash-mn-hd-3-116422.jpg'), filename: 'clapton.jpg', content_type:'image/jpg')
clapton.photos.attach(io: File.open('app/assets/images/clapton-head.jpg'), filename: 'clapton2.jpg', content_type:'image/jpg')

jp = Instrument.create!(
  instrument_type: "Electric Guitar",
  user_id: 2,
  brand: "Music Man",
  name: "JP 15",
  year: 2020,
  price_per_day: 249,
  description: "The JP15 features a lightweight Okoume body with a figured maple top. Available in Sahara Burst (with roasted maple top), Trans Black Burst, and new Cerulean Paradise, each beautiful finish compliments the flame or quilt figuring with stunning effect. Roasted maple neck and fingerboard adds just the right amount of snap and brightness while providing more stability in ever-changing climates. The JP 15 is powered by twin custom DiMarzio Illuminator pickups, piezo bridge system and onboard 20db gain boost.",
  for_rent: true
)
jp.photos.attach(io: File.open('app/assets/images/slide-30.jpg'), filename: 'jp.jpg', content_type:'image/jpg')
jp.photos.attach(io: File.open('app/assets/images/slide-30 (1).jpg'), filename: 'jp1.jpg', content_type:'image/jpg')
jp.photos.attach(io: File.open('app/assets/images/slide-30 (2).jpg'), filename: 'jp2.jpg', content_type:'image/jpg')
jp.photos.attach(io: File.open('app/assets/images/slide-30 (3).jpg'), filename: 'jp3.jpg', content_type:'image/jpg')

prs = Instrument.create!(
  instrument_type: "Electric Guitar",
  user_id: 1,
  brand: "PRS",
  name: "Custom 24",
  year: 2021,
  price_per_day: 299,
  description:"The Custom 24 is the quintessential PRS guitar. This iconic instrument was the first model that Paul Reed Smith brought to the public at PRS Guitars’ first Winter NAMM show in 1985 and has been a top seller ever since. Played by internationally touring artists, gigging musicians, and aspiring players, the Custom 24 features PRS’s patented Gen III tremolo system and PRS 85/15 pickups with volume and tone controls and a 5-way blade switch. 85/15 pickups were personally designed by Paul Reed Smith to offer remarkable clarity and extended high and low end." ,
  for_rent: true
)
prs.photos.attach(io: File.open('app/assets/images/prs1.jfif'), filename: 'prs1.jpg', content_type:'image/jpg')
prs.photos.attach(io: File.open('app/assets/images/prs2.jfif'), filename: 'prs2.jpg', content_type:'image/jpg')
prs.photos.attach(io: File.open('app/assets/images/prs3.jfif'), filename: 'prs3.jpg', content_type:'image/jpg')
prs.photos.attach(io: File.open('app/assets/images/prs4.jfif'), filename: 'prs4.jpg', content_type:'image/jpg')

stingray = Instrument.create!(
  instrument_type: "Bass",
  user_id: 2,
  brand: "Music Man",
  name: "Stingray 5 Special",
  year: 2018,
  price_per_day: 219,
  description: "The first bass designed by Ernie Ball Music Man, the Stingray 5 was unveiled in 1987 and has been an industry standard for extended range basses ever since. With its powerful punchy sound, the added flexibility of additional pickups, and a comfortably contoured body, the StingRay 5 satisfies even the most demanding of players.",
  for_rent: true
)

stingray.photos.attach(io: File.open('app/assets/images/stingray.jpg'), filename: 'stingray.jpg', content_type:'image/jpg')
stingray.photos.attach(io: File.open('app/assets/images/stingray2.jpg'), filename: 'stingray2.jpg', content_type:'image/jpg')
stingray.photos.attach(io: File.open('app/assets/images/stingray3.jpg'), filename: 'stingray3.jpg', content_type:'image/jpg')
stingray.photos.attach(io: File.open('app/assets/images/stingray4.jpg'), filename: 'stingray4.jpg', content_type:'image/jpg')


puts "#{User.count} Users created"
puts "#{Instrument.count} Instrumentss created"
