class CustomDeviseMailer < Devise::Mailer
  default from: 'no-reply@homedern.com'
  layout 'mailer'

  def welcome_email(record, opts = {})
    @user = record
    mail(to: @user.email, subject: "Bienvenue chez Homedern !")
  end
end
