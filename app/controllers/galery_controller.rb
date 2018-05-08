class GaleryController < ApplicationController
  def index
    # Photo.all.each {|s| s.avatar.reprocess!}
    @logo = Photo.where(logo: true).first
    @background_image = Photo.where(background: true).first
    @galery_images = Photo.where(galery: true)
    @galery_images_counter = 0


    @analitics = VisitsCounter.all.first()
    if @analitics == nil
      VisitsCounter.create(home: 0, menu: 0, contact: 0, galery: 0)
      @analitics = VisitsCounter.all.first()
    end
    home_count = @analitics.home
    menu_count = @analitics.menu
    galery_count = @analitics.galery + 1
    contact_count = @analitics.contact
    @analitics.update(home: home_count, menu: menu_count, galery: galery_count, contact: contact_count)

  end

end
