class AddHomeToPhoto < ActiveRecord::Migration[5.1]
  def change
    add_column :photos, :home, :boolean
  end
end
