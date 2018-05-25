class AdminController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :is_logged?
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
    @new_fill = BurgerFill.new
    @all_fills = BurgerFill.all
    @new_bread = Bread.new
    @all_breads = Bread.all
    @new_burger_type_fill = BurgerFillType.new
    @all_burger_fill_data = BurgerFillType.get_fill
    @all_burger_type_data = BurgerFillType.get_types
    @all_burger_fill_type = BurgerFillType.all
    @list_fills_combo_box = BurgerFill.all_fills
    @list_burgers_combo_box = BurgerType.all_fills
    @all_attach = Potato.all
    @menu_messeges = MenuMessege.all.first()
    if @menu_messeges.nil?
      @menu_messeges = MenuMessege.create()
    end
    @i = 0
    @new_attach = Potato.new
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
  def update
    if params[:burger_fill]
      burger_fill = BurgerFill.find(params[:burger_fill][:id])
      burger_fill.update(burger_fill_params)
    end
    if params[:bread]
      bread = Bread.find(params[:bread][:id])
      bread.update(bread_params)
    end
    if params[:burger_fill_type]
      burger_fill_type = BurgerFillType.find(params[:burger_fill_type][:id])
      burger_fill_type.update(burger_fill_types_params)
    end
    if params[:menu_messege]
      var = MenuMessege.find(params[:menu_messege][:id])
      var.update(messege:params[:menu_messege][:messege])
    end
  end

  def create
    if params[:burger_fill]
      BurgerFill.create(burger_fill_params)
    end
    if params[:bread]
      Bread.create(bread_params)
    end
    if params[:burger_fill_type]
      BurgerFillType.create(burger_fill_types_params)
    end
    if params[:potato]
      Potato.create(weight:params[:potato][:weight], price:params[:potato][:price], units: params[:potato][:units])
    end
  end

  def destroy
    if params[:burger_fill]
      burger_fill = BurgerFill.find(params[:burger_fill][:id])
      burger_fill.destroy
    end
    if params[:bread]
      bread = Bread.find(params[:bread][:id])
      bread.destroy
    end
    if params[:burger_fill_type]
      burger_fill_type = BurgerFillType.find(params[:burger_fill_type][:id])
      burger_fill_type.destroy
    end
    if params[:potato]
      var = Potato.find(params[:potato][:id])
      var.destroy
    end
  end
  def login
    @the_user = User.new
  end
  def burger_fill_params
    params.require(:burger_fill).permit(:fill_detail)
  end
  def bread_params
    params.require(:bread).permit(:name)
  end
  def burger_fill_types_params
    params.require(:burger_fill_type).permit(:burger_fill_id, :burger_type_id, :price)
  end

  def is_logged?
    id = session[:current_session_id]
    if id == nil and params[:action] != "login"
      redirect_to '/login'
      return false
    end
  end

end
