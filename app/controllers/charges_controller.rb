class ChargesController < ApplicationController
  # before_action :set_amount, only: [:new, :create]

  def new
    @amount
  end

  def create
    binding.pry
    @order = current_user.orders.find(params[:order_id])
    @amount = @order.amount

    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer:    customer.id,
      amount:      @amount,
      description: "Westeros Outfitters Checkout",
      currency:    "usd"
    )

    redirect_to 'orders#create'

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  # private
  #
  # def set_amount
  #   binding.pry
  #   @order = current_user.orders.find(params[:order_id])
  #   @amount = @order.amount
  # end
end
