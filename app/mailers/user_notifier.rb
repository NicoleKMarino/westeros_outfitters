class UserNotifier < ActionMailer::Base
  default from: 'do-not-reply@westerosoutfitters.herokuapp.com'

  def send_signup_email(user)
    @user = user
    @url  = "http://westerosoutfitters.herokuapp.com/login"
    mail(to: @user.email, subject: "Welcome to Westeros Outfitters!")
  end

  def send_order_confirmation(user, order)
    @user = user
    @order = order
    mail(to: @user.email, subject: 'Westeros Outfitters has received your order!')
  end
end
