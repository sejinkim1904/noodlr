class ItemsController < ApplicationController
  def show
    @item = Item.includes(:restaurant).find(params[:id])
  end

  def autocomplete
    render json: Item.search(params[:query], {
      fields: ["name^5"],
      match: :word_start,
      limit: 10,
      load: false,
      misspellings: {below: 5}
    }).map(&:name)
  end
end
