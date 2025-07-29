# 🏠 Homedern

**Homedern** is a minimalist e-commerce platform built with **Ruby on Rails**.  
It allows users to browse smart-tech products and place secure orders through **Stripe Checkout**.

---

## 🚀 Features

- 🔐 User authentication with **Devise**
- 🛍️ Product catalog with name, description, image and price
- 📦 Order management system (`Order`, `OrderItem`)
- 💳 Stripe integration for online payments
- 🌱 Automatic seed data for demo/testing (`rails db:seed`)
- 📱 Responsive UI using Bootstrap

---

## 🧱 Data Models

User
└── has_many :orders

Order
├── belongs_to :user
├── has_many :order_items
└── has_many :products, through: :order_items

OrderItem (join table)
├── belongs_to :order
└── belongs_to :product

Product
└── has_many :order_items

yaml
Copier
Modifier

---

## ⚙️ Setup Instructions

1. **Clone the project:**
```bash
git clone git@github.com:Drixyz13/homedern.git
cd homedern/homedern_app
Install dependencies:

bash
bundle install
Configure the database:

bash
rails db:create db:migrate db:seed
Start the server:

bash
rails server
Then open http://localhost:3000 in your browser.

💳 Stripe Configuration
Create a .env file at the root of your app:

ini
STRIPE_SECRET_KEY=sk_test_your_secret_key
STRIPE_PUBLISHABLE_KEY=pk_test_your_publishable_key
💡 Get your test keys from: https://dashboard.stripe.com/test/apikeys

Ensure .env is listed in .gitignore (it already is by default).

The Stripe initializer is located at:

config/initializers/stripe.rb
ruby
Stripe.api_key = ENV['STRIPE_SECRET_KEY']
📧 Emails
A welcome email is sent to new users upon registration

A confirmation email is sent after a successful Stripe payment

In development, emails are previewed in-browser using letter_opener.

👨‍💻 Author
This project was developed solo as part of the The Hacking Project full-stack bootcamp.
Built by Matt Mariller – @Drixyz13

