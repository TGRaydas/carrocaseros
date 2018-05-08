class MenuController < ApplicationController
  def index
    all_fills = BurgerFill.all
    @background_image = Photo.where(background: true).sample
    @logo = Photo.where(logo: true).first
    @all_fills = []
    all_fills.each do |fill|
      burger_type_price = [fill.fill_detail]
      bft = BurgerFillType.where(burger_fill_id: fill.id)
      all_types_prices = []
      bft.each do |btf|
        bt = BurgerType.find(btf.burger_type_id)
        dict = [:type => bt.name, :price => btf.price]
        all_types_prices.push(dict)
      end
      burger_type_price.push(all_types_prices)
      @all_fills.push(burger_type_price)
    end
    @analitics = VisitsCounter.all.first()
    if @analitics == nil
      VisitsCounter.create(home: 0, menu: 0, contact: 0, galery: 0)
      @analitics = VisitsCounter.all.first()
    end
    home_count = @analitics.home
    menu_count = @analitics.menu + 1
    galery_count = @analitics.galery
    contact_count = @analitics.contact
    @analitics.update(home: home_count, menu: menu_count, galery: galery_count, contact: contact_count)

  end
end
