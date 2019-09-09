class Default::BaseController < ApplicationController
  before_action :require_default

  private

  def require_default
    unless current_user.default? && current_user.registered == 'true'
      redirect_to root_path
    end
  end
end
