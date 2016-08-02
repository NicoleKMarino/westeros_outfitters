class UserNotifier < ActionMailer::Base
  default from: 'westerosoutfitters@gmail.com'

  def send_signup_email(user)
    @user = user
    mail(to: @user.email, subject: 'Thanks for signing up with Westeros Outfitters!')
  end

  def order_confirmation(user, order)
    @user = user
    @order = order
    mail(to: @user.email, subject: 'Westeros Outfitters has received your order!')
  end
end
