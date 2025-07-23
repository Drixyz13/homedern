# 🏠 Homedern

Homedern est une mini-plateforme e-commerce développée avec Ruby on Rails.  
Elle permet aux utilisateurs de parcourir un catalogue de produits et de passer commande en ligne via Stripe.

---

## 🚀 Fonctionnalités

- Authentification avec Devise (inscription, connexion, session sécurisée)
- Catalogue produits avec nom, description, image, prix
- Système de panier et de commande (`Order`, `OrderItem`)
- Paiement en ligne avec Stripe (à venir)
- Seed automatique des données pour la démo (`rails db:seed`)
- Interface responsive avec Bootstrap (ou autre framework CSS au choix)

---

## 🧱 Modèle de données (MVP)

User
└── has_many :orders

Order
├── belongs_to :user
├── has_many :order_items
└── has_many :products, through: :order_items

OrderItem (table de jointure)
├── belongs_to :order
└── belongs_to :product

Product
└── has_many :order_items



---

## 🛠️ Installation

1. **Clone le projet :**
```bash
git clone git@github.com:Drixyz13/homedern.git
cd homedern/homedern_app
Installe les gems :

bash
Copier
Modifier
bundle install
Configure la base de données :


rails db:create db:migrate db:seed
Lance le serveur :


rails server
Puis visite http://localhost:3000

📦 Gems principales
devise – Authentification des utilisateurs

dotenv-rails – Variables d’environnement

stripe – Intégration du paiement (à venir)

faker – Génération de fausses données (dev seulement)

👤 Auteur
Projet développé en solo dans le cadre du bootcamp The Hacking Project.
Développé par Matt Mariller – @Drixyz13
