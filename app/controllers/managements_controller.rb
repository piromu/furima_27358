class ManagementsController < ApplicationController
  before_action :sold_out?
  
  def index
    @item_order = ItemOrder.new 
  end

  def create
    @item_order = ItemOrder.create(item_id: @item.id, user_id: current_user.id)
    if @item_order.valid? && Address.create(address_params).valid?
      payjp_chage
      redirect_to root_path
    else
      @item_order.destroy
      render item_transactions_path
    end
  end
end