class Default::ReviewsController < Default::BaseController
  def new
    @item = Item.find(params[:item_id])
  end

  def create
    unless current_user.reviewable?(params[:item_id])
      flash[:error] = 'Review could not be saved.'
      redirect_to new_default_item_review_path(params[:item_id])
    end
    review = Review.create(review_params.merge(user: current_user).merge(item_id: params[:item_id]))
    if review.save
      session[:item_id] = review.id
			flash[:notice] = 'Review created.'
			redirect_to item_path(params[:item_id])
    else
      flash[:error] = 'Review could not be saved.'
      redirect_to new_default_item_review_path(params[:item_id])
    end
  end

  private

  def review_params
    params.require(:review).permit(:title, :body, :rating)
  end
end
