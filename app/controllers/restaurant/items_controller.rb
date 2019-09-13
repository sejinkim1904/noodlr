class Restaurant::ItemsController < Restaurant::BaseController
  def update
    item = Item.find(params[:id])
    if item.restaurant_id == current_user.restaurant_id
      item.update_attributes(status: 'verified')
    end
    flash[:notice] = 'This item has been verified!'
    redirect_to dashboard_path
  end
end
