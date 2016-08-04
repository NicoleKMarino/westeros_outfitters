class ChargesController < ApplicationController

  def new
    @amount = session[:order_amount]
    session[:order_amount] = nil
    @amount = params['amount']
  end

  def create
    @order = current_user.orders.find(params[:order_id])
    @amount = @order.amount
    session[:order_amount] = @amount

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

  rescue Stripe::CardError => e
    flash[:error] = e.message

    redirect_to new_charge_path(amount: @amount)
    @order.status = 1
    @order.save


  end
end
