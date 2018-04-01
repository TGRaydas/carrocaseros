class CreateBurgerFills < ActiveRecord::Migration[5.1]
  def change
    create_table :burger_fills do |t|
      t.string :fill_detail

      t.timestamps
    end
  end
end
