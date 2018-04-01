class SocialMediasController < ApplicationController
  def create
    SocialMedium.create(media_params)
  end
  def show

  end
  def update
    media = EmailContact.find(params[:id])
    media.update_attributes(media_params)
  end

  def media_params
    params.require(:social_medium).permit(:link, :facebook, :instagram, :twitter)
  end
end
