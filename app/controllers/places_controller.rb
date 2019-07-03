class PlacesController < ApplicationController
  def index
    @places = Place.all.order(:name).page params[:page]
  end
end
