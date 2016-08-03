class Admin::ItemsController < Admin::BaseController
  before_action :set_item, only: [:edit, :update]

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "Successfully Created Item!"
      redirect_to @item
    else
      flash.now[:error] = @item.errors.full_messages.join('. ')
      render :new
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      flash[:notice] = "Successfully Updated Item!"
      redirect_to @item
    else
      flash[:error] = @item.errors.full_messages.join('. ')
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :img, :price, :description, :retired, :category_id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
