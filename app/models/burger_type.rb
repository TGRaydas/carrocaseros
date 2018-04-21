class BurgerType < ApplicationRecord
  has_many :burger_fill_types
  has_many :burger_fills, through: :burger_fill_types
  def self.all_fills
    list_fills_combo_box = []
    all_burger_fills = BurgerType.all
    all_burger_fills.each do |fill|
      list = [fill[:name], fill[:id]]
      list_fills_combo_box.push(list)
    end
    return list_fills_combo_box
  end

end
