class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item)
    .permit(:image,
    :name,
    :introduction,
    :category_id,
    :condition,
    :price,
    :delivery_fee,
    :delivery_days,
    :prefecture_id)
    .merge(user_id: current_user.id)
  end
end
