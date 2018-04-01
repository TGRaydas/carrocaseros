class CreateWelcomeData < ActiveRecord::Migration[5.1]
  def change
    create_table :welcome_data do |t|
      t.string :messege
      t.boolean :active

      t.timestamps
    end
  end
end
