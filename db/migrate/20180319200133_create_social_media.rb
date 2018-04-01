class CreateSocialMedia < ActiveRecord::Migration[5.1]
  def change
    create_table :social_media do |t|
      t.string :link
      t.boolean :facebook
      t.boolean :instagram
      t.boolean :twitter

      t.timestamps
    end
  end
end
