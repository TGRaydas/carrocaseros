class ContactController < ApplicationController
  def index
    @contacts = Contact.where(active: true)
    @emails_contact = EmailContact.all
    @background_image = Photo.where(background: true).sample
    @logo = Photo.where(logo: true).first
    @facebook_link = SocialMedium.where(facebook: true).first
    @instagram_link = SocialMedium.where(instagram: true).first
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
