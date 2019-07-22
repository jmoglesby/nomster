class PhotosController < ApplicationController
  before_action :authenticate_user!

  def create
    @place = Place.find(params[:place_id])
    new_photo = @place.photos.create(photos_params.merge(user: current_user))

    unless new_photo.id
      flash[:alert] = "Photo too large or not the right file type."
    end

    redirect_to place_path(@place)
  end

  private # >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  def photos_params
    params.require(:photo).permit(:caption, :uploaded_photo)
  end
end
