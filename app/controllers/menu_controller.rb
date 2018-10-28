class MenuController < ApplicationController
  def index
    @all_fills = BurgerFill.all
    @background_image = Photo.where(background: true).sample
    @logo = Photo.where(logo: true).first
    @all_potatos = Potato.all
    @menu_message = MenuMessege.all.first()
  end
end
