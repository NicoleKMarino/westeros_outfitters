class OrdersController < ApplicationController
  before_action :current_user
  before_action :set_orders, only: [:index, :show, :create]


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
      UserMailer.send_order_confirmation(@order, current_user).deliver_now
      redirect_to @order
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
