class ItemsController < ApplicationController
  def show
    @item = Item.includes(:restaurant).find(params[:id])
  end
end
