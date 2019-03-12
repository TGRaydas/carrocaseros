class ShopController < ApplicationController
  skip_before_action :verify_authenticity_token
  def fills_api
    data = params[:id]
    fill = BurgerFill.find(data)
    list = []
    fill.burger_fill_types.each do |t|
      list.push([BurgerType.find(t.burger_type_id).name, t.burger_type_id, t.price])
    end
    render json: list
  end
  def add
    list = params[:fill] +','+ params[:type] +','+ params[:cant]
    if cookies["shop"].nil?
      cookies["shop"] = ""
    else
      cookies["shop"] += ";"
    end
    cookies["shop"] += list
    render json:{message:"ok"}
  end
  def index
    @background_image = Photo.where(background: true).sample
    @logo = Photo.where(logo: true).first
    @data = []
    @total = 25000
    if cookies["shop"] != nil
      @data = cookies["shop"].split(";")
    end
    @data.each do |d|
      fill = d.split(",")
      @total += BurgerFillType.where(burger_fill: fill[0], burger_type: fill[1]).first.price * Integer(fill[2])
    end
    respond_to do |format|
      format.html
      format.pdf {render template: 'shop/index', pdf: "presupuesto"}
    end
  end
  def update
    list = ""
    param = params[:data]
    param = param.split(",")
    data = cookies["shop"].split(";")
    data.each do |d|
      da = d.split(",")
      if da[0] == param[0] and da[1] == param[1]
        list += param[0] + "," + param[1] + "," + param[2] + ";"
      else
        list += d + ";"
      end
    end
    cookies["shop"] = list[0...-1]
  end
  def delete
    list = ""
    param = params[:data]
    data = cookies["shop"].split(";")
    data.each do |d|
      if d != param
        list += d + ";"
      end
    end
    cookies["shop"] = list[0...-1]
  end
end
