puts "🧹 Cleaning database..."
OrderItem.destroy_all
Order.destroy_all
Product.destroy_all
User.destroy_all
puts "✅ Database cleaned"

# 👤 Admin test user
user = User.create!(
  email: "matt@homedern.com",
  password: "password",
  password_confirmation: "password"
)
puts "👤 User created: #{user.email}"

# 🧠 AI Products
Product.create!(
  name: "Homedern Pod",
  description: "Pilotez votre maison à la voix : lumière, musique, achats, infos... tout devient simple et instantané. Compatible Apple, Android, Alexa.",
  price_cents: 19900,
  image_url: "presentation/homedern_pod.jpg"
)

Product.create!(
  name: "Homedern Temps",
  description: "Climatisez automatiquement votre intérieur selon votre présence, vos habitudes et la météo. En partenariat avec Mitsubishi Electric.",
  price_cents: 49900,
  image_url: "presentation/homedern_temps.jpg"
)

Product.create!(
  name: "Homedern Fridge",
  description: "Gérez votre alimentation, vos stocks et vos recettes grâce à ce frigo connecté relié à MyFitnessPal et Samsung Health.",
  price_cents: 79900,
  image_url: "presentation/homedern_fridge.jpg"
)
puts "🛍️ 3 AI products created"
