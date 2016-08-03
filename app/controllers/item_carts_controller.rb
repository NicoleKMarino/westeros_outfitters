class ItemCartsController < ApplicationController
  before_action :set_item, only: [:create, :increment, :decrement]
  before_action :add_item, only: [:create, :increment]

  def create
    session[:cart] = @cart.contents
    flash[:alert] = "#{@item.name} has been added to your cart!"
    redirect_to request.referrer
  end

  def show
    @items = @cart.items
  end

  def increment
    redirect_to request.referrer
  end

  def decrement
    @cart.subtract_item(@item.id)
    if @cart.quantity(@item) == 0
      destroy
    else
      redirect_to request.referrer
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @cart.remove_item(@item.id)
    flash[:item_removed] = "Successfully removed " \
                           "#{view_context.link_to @item.name, item_path(@item)}" \
                           " from your cart."
    redirect_to request.referrer
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def add_item
    @cart.add_item(@item.id)
  end
end
