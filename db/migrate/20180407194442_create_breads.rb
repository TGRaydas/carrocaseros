class CreateBreads < ActiveRecord::Migration[5.1]
  def change
    create_table :breads do |t|
      t.string :string
      t.string :name
      t.string :int
      t.string :price

      t.timestamps
    end
  end
end
