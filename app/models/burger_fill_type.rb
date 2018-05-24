class BurgerFillType < ApplicationRecord
  belongs_to :burger_fill
  belongs_to :burger_type

  def self.get_fill
    list = []
    burger_fill_types = BurgerFillType.all
    burger_fill_types.each do |bft|
      burger_type = BurgerType.where(id: bft[:burger_type_id]).first
      combo_box_fills = []
      row_fills = []
      ids = []
      combo_box_fills.push(burger_type[:name])
      combo_box_fills.push(burger_type[:id])
      row_fills.push(combo_box_fills)
      ids.push(burger_type[:id])
      burger_type = BurgerType.all
      burger_type.each do |bf|
        unless ids.include?(bf[:id])
          combo_box_fills = []
          combo_box_fills.push(bf[:name])
          combo_box_fills.push(bf[:id])
          ids.push(bf[:id])
          row_fills.push(combo_box_fills)
        end
      end
      list.push(row_fills)
    end
    return list
  end
  def self.get_types
    list = []
    burger_fill_types = BurgerFillType.all
    burger_fill_types.each do |bft|
      burger_fill = BurgerFill.where(id: bft[:burger_fill_id]).first
      row_fills = []
      combo_box_fills = []
      ids = []
      if !burger_fill.nil?
        combo_box_fills.push(burger_fill[:fill_detail])
        combo_box_fills.push(burger_fill[:id])
        row_fills.push(combo_box_fills)
        burger_fill = BurgerFill.all
        burger_fill.each do |bf|
          unless ids.include?(bf[:id])
            combo_box_fills = []
            combo_box_fills.push(bf[:fill_detail])
            combo_box_fills.push(bf[:id])
            row_fills.push(combo_box_fills)
            ids.push(bf[:id])
          end
        end
      end
      list.push(row_fills)
    end
    return list
  end
end
