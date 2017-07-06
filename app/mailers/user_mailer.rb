class UserMailer < ApplicationMailer
  default from: 'junglerail@yahoo.com'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.order_confirmation.subject
  #
  def order_confirmation
    @greeting = "Hi"

    mail to: "junglerail@yahoo.com"
  end
end
