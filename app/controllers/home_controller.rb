class HomeController < ApplicationController
  def index
    @messege = WelcomeDatum.first
    @logo = Photo.where(logo: true).first
    @background_image = Photo.where(background: true).sample
    @facebook_link = SocialMedium.where(facebook: true).first
    @instagram_link = SocialMedium.where(instagram: true).first
  end
end
