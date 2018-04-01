class GaleryController < ApplicationController
  def index
    # Photo.all.each {|s| s.avatar.reprocess!}
    @logo = Photo.where(logo: true).first
    @background_image = Photo.where(background: true).first
    @galery_images = Photo.where(galery: true)
    @galery_images_counter = 0

  end

end
