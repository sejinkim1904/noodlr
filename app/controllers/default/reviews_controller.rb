class Default::ReviewsController < ApplicationController
  def new
    @item = Item.find(params[:item_id])
  end

  def create
    review = Review.create(review_params.merge(user: current_user).merge(item_id: params[:item_id]))
    if review.save
      session[:item_id] = review.id
			flash[:notice] = 'Review created.'
			redirect_to send_registration_path
    else
      flash[:error] = 'Review could not be saved.'
      redirect_to new_default_item_review_path
    end
  end

  private

  def review_params
    params.require(:review).permit(:title, :body, :rating)
  end
end
