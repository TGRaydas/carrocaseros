class ContactController < ApplicationController
  def index
    @contacts = Contact.where(active: true)
    @emails_contact = EmailContact.all
    @background_image = Photo.where(background: true).sample
    @logo = Photo.where(logo: true).first
    @facebook_link = SocialMedium.where(facebook: true).first
    @instagram_link = SocialMedium.where(instagram: true).first


    @analitics = VisitsCounter.all.first()
    if @analitics == nil
      VisitsCounter.create(home: 0, menu: 0, contact: 0, galery: 0)
      @analitics = VisitsCounter.all.first()
    end
    home_count = @analitics.home
    menu_count = @analitics.menu
    galery_count = @analitics.galery
    contact_count = @analitics.contact + 1
    @analitics.update(home: home_count, menu: menu_count, galery: galery_count, contact: contact_count)

  end


  def create
    Contact.create(contact_params)
  end

  def update
    Contact.find(params[:id]).update_attributes(contact_params)
  end

  def destroy

  end

  def contact_params
    params.require(:contact).permit(:name, :phone, :active)
  end
end
