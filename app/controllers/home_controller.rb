class HomeController < ApplicationController
  def index
    @messege = WelcomeDatum.first
    @logo = Photo.where(logo: true).first
    @background_image = Photo.where(background: true).sample
    @facebook_link = SocialMedium.where(facebook: true).first
    @instagram_link = SocialMedium.where(instagram: true).first
    @analitics = VisitsCounter.all.first()
    if @analitics == nil
      VisitsCounter.create(home: 0, menu: 0, contact: 0, galery: 0)
      @analitics = VisitsCounter.all.first()
    end
    home_count = @analitics.home + 1
    menu_count = @analitics.menu
    galery_count = @analitics.galery
    contact_count = @analitics.contact
    @analitics.update(home: home_count, menu: menu_count, galery: galery_count, contact: contact_count)

  end
end
