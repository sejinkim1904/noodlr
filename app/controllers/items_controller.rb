class ItemsController < ApplicationController
  def show
    @item = Item.includes(:restaurant, :reviews).find(params[:id])
  end
end
