class BurgerFill < ApplicationRecord
  has_many :burger_fill_types
  has_many :burger_types, through: :burger_fill_types
  def self.all_fills
    list_fills_combo_box = []
    all_burger_fills = BurgerFill.all
    all_burger_fills.each do |fill|
      list = [fill.fill_detail, fill.id]
      list_fills_combo_box.push(list)
    end
    return list_fills_combo_box
  end
end
