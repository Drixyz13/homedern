class StripeCheckoutController < ApplicationController
  before_action :authenticate_user!

  def create
    product = Product.find(params[:product_id])

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [
        {
          price_data: {
            currency: 'eur',
            product_data: {
              name: product.name,
              description: product.description
            },
            unit_amount: product.price_cents
          },
          quantity: 1
        }
      ],
      mode: 'payment',
      success_url: success_stripe_checkout_url + "?product_id=#{product.id}&session_id={CHECKOUT_SESSION_ID}",
      cancel_url: product_url(product)
    )

    redirect_to session.url, allow_other_host: true
  end

    def success
    session_id = params[:session_id]
    product = Product.find(params[:product_id])
    session = Stripe::Checkout::Session.retrieve(session_id)

    order = current_user.orders.create!(
      total_cents: product.price_cents,
      stripe_payment_id: session_id,
      status: "paid"
    )

    
    order.order_items.create!(
      product: product,
      quantity: 1,
      price_at_order: product.price_cents
    )

    redirect_to product_path(product), notice: "Merci pour votre achat !"
  rescue Stripe::InvalidRequestError
    redirect_to root_path, alert: "Erreur de confirmation du paiement."
  end

end