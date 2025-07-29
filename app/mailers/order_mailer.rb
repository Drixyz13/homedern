class OrderMailer < ApplicationMailer
 default from: 'no-reply@homedern.com'

  def confirmation_email(order)
    @order = order
    @user = @order.user
    mail(to: @user.email, subject: "Confirmation de votre commande Homedern")
  end
end