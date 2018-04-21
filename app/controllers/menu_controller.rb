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
  end
end
