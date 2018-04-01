class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.boolean :logo
      t.boolean :galery
      t.boolean :background
      t.timestamps
    end
  end
end
