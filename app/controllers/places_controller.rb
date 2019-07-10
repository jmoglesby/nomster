class PlacesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @places = Place.all.order(:name).page params[:page]
  end

  def show
    @place = Place.find(params[:id])
  end

  def new
    @place = Place.new
  end

  def create
    @place = current_user.places.create(place_params)
    if @place.valid?
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @place = Place.find(params[:id])

    if current_user != @place.user
      flash[:alert] = "You cannot edit that Place"
      redirect_to place_path(@place)
    end
  end

  def update
    @place = Place.find(params[:id])

    if current_user != @place.user
      return render plain: 'Not Allowed', status: :forbidden
    end

    @place.update_attributes(place_params)
    if @place.valid?
      redirect_to place_path(@place)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @place = Place.find(params[:id])
    
    if current_user != @place.user
      return render plain: 'Not Allowed', status: :forbidden
    end
    
    @place.destroy
    flash[:notice] = 'Place was successfully deleted.'
    redirect_to root_path
  end

  private #>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  def place_params
    params.require(:place).permit(:name, :description, :address)
  end

end
