class CreateBurgerFillTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :burger_fill_types do |t|
      t.belongs_to :burger_type
      t.belongs_to :burger_fill
      t.integer :price
      t.timestamps
    end
  end
end
