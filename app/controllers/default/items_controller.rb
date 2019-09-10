class Default::ItemsController < Default::BaseController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @item = Item.new
  end

  def create
    item = Item.create(item_params.merge(status: 'pending').merge(restaurant_id: params[:restaurant_id]))
    review = Review.create(review_params.merge(user: current_user).merge(item: item))
    if item.save && review.save
      session[:item_id] = review.id
			flash[:notice] = 'Item has been suggested to restaurant owner for approval.'
      redirect_to send_item_verification_path(params[:restaurant_id])
    else
      flash[:error] = 'Item could not be saved.'
      redirect_to new_default_restaurant_item_path(params[:restaurant_id])
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :category, :image)
  end

  def review_params
    params[:item].require(:review).permit(:title, :body, :rating)
  end
end
