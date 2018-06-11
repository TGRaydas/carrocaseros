class PhotosController < ApplicationController
  def create
    @photo = Photo.create(photo_params)
  end

  def update
    photo = Photo.find(params[:id])
    photo.update_attributes(photo_params)
    flash[:alert] = "Se actualizo correctamente"
  end

  def destroy
    photo = Photo.find(params[:id]).destroy
  end
  private

# Use strong_parameters for attribute whitelisting
# Be sure to update your create() and update() controller methods.

  def photo_params
    params.require(:photo).permit(:logo, :galery, :background, :home, :avatar)
  end
end