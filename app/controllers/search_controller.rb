class SearchController < ApplicationController
  def index
    @coordinates = location.coordinates
    render locals: { facade: SearchFacade.new(params[:query]) }
  end
end
