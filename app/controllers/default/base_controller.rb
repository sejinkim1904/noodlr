class Default::BaseController < ApplicationController
  before_action :require_default

  private

  def require_default
    redirect_to root_path unless current_user.default? && current_user.registered == 'true'
  end
end
