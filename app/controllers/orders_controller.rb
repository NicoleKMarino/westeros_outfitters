class OrdersController < ApplicationController
  before_action :current_user
  before_action :set_orders, only: [:index, :show, :create]

  protect_from_forgery except: [:hook]
  def hook
    params.permit! # Permit all Paypal input params
    status = params[:payment_status]
    if status == "Completed"
      @order = Order.find(params[:invoice])
      @order.update_attributes(notification_params: params, status: status, transaction_id: params[:txn_id], purchased_at: Time.now)
    end
    render nothing: true
  end

  def index
  end

  def show
    if @orders.find_by(id: params[:id]).nil?
      render file: '/public/404'
    else
      @order = @orders.find(params[:id])
      render :show
    end
  end

  def create
    @order = @orders.new(amount: @cart.total, status: 0)
    if @order.save
      @order.add_order_items(@cart)
      UserMailer.order_confirmation(@order, current_user).deliver_now
      redirect_to @order.paypal_url(order_path(@order))
      session[:cart] = {}
    else
      render :new
    end
  end

  private

  def set_orders
    @orders = current_user.orders
  end
end
