class OrdersController < ApplicationController
  before_filter :current_user

  def show
    @order = Order.find(params[:id])
  end



  def new

    @order = Order.new
  end

  def create
    session[:cart] = @cart.contents
    @total = @cart.total
    @order = Order.create(amount: @total)
    redirect_to @order
    @cart.contents.clear
  end

  def index
    @orders = Order.all
  end
end
