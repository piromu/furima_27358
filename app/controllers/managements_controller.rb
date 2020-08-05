class ManagementsController < ApplicationController
  before_action :sold_out?
  
  def index
    @item_order = ItemOrder.new 
  end