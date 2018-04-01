class CreatePotatos < ActiveRecord::Migration[5.1]
  def change
    create_table :potatos do |t|
      t.integer :price
      t.string :weight
      t.integer :units

      t.timestamps
    end
  end
end
