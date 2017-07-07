class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def order_confirmation(email,items)
    @line_items=items
    mail to: email, subject: 'Jungle order confirmation'
  end
end
