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
Product.create!([
  {
    name: "Homedern Pod",
    description: "Your voice assistant for a smarter home. Connects to Amazon, Apple Pay and your smartphone. Ask anything, control everything.",
    price_cents: 12900,
    image_url: "https://via.placeholder.com/600x400?text=Homedern+Pod"
  },
  {
    name: "Homedern Climate",
    description: "Premium upgrade for your Pod. Automatically adjusts your air conditioning based on real-time indoor temperature.",
    price_cents: 18900,
    image_url: "https://via.placeholder.com/600x400?text=Homedern+Climate"
  },
  {
    name: "Homedern Fridge+",
    description: "Your fridge companion with touchscreen. Tracks food levels, connects to MyFitnessPal and suggests healthy recipes from Marmiton.",
    price_cents: 21900,
    image_url: "https://via.placeholder.com/600x400?text=Homedern+Fridge+%2B"
  }
])
puts "🛍️ 3 AI products created"
