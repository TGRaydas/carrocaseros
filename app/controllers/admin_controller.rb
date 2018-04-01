class AdminController < ApplicationController
  def index
    @logo = Photo.where(logo: true).first
    @photos = Photo.all
    @background_image = Photo.where(background: true).sample
    @messege = WelcomeDatum.first
    @add_photo = Photo.new
    @contacts = Contact.all
    @new_contact = Contact.new
    @emails = EmailContact.all
    @new_email = EmailContact.new
    @facebook = SocialMedium.where(facebook: true).first
    @instagram = SocialMedium.where(instagram: true).first
    @burger_types = BurgerType.all
    @new_burger_type = BurgerType.new
    if @facebook == nil
      @facebook = SocialMedium.new
      @facebook.facebook = true
      @facebook.instagram = false
      @facebook.twitter = false
    end
    if @instagram == nil
      @instagram = SocialMedium.new
      @instagram.facebook = false
      @instagram.instagram = true
      @instagram.twitter = false
    end
    if @messege == nil
      @messege = WelcomeDatum.new
    end

  end
  def create

  end

end
