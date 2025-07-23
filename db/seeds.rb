puts "🧹 Cleaning database..."
OrderItem.destroy_all
Order.destroy_all
Product.destroy_all
User.destroy_all

puts "✅ Base cleaned"


user = User.create!(
  email: "matt@homedern.com",
  password: "password",
  password_confirmation: "password"
)
puts "👤 User created"


product1 = Product.create!(
  name: "Lampe LED design",
  description: "Une lampe moderne à lumière douce",
  price_cents: 1499,
  image_url: "https://via.placeholder.com/300x200"
)

product2 = Product.create!(
  name: "Chaise Scandinave",
  description: "Chaise confortable et élégante",
  price_cents: 5499,
  image_url: "https://via.placeholder.com/300x200"
)

product3 = Product.create!(
  name: "Table basse bois clair",
  description: "Parfaite pour les salons modernes",
  price_cents: 7999,
  image_url: "https://via.placeholder.com/300x200"
)

puts "🛒 Produits créés : #{Product.count}"


order = Order.create!(
  user: user,
  status: "paid",
  total_cents: product1.price_cents * 2 + product2.price_cents,
  stripe_payment_id: "demo_123456"
)

puts "🧾 Order créée pour #{user.email}"


OrderItem.create!(
  order: order,
  product: product1,
  quantity: 2,
  price_at_order: product1.price_cents
)

OrderItem.create!(
  order: order,
  product: product2,
  quantity: 1,
  price_at_order: product2.price_cents
)

puts "✅ Commande remplie avec #{order.order_items.count} articles"
puts "🌱 SEED TERMINÉ ✅"
