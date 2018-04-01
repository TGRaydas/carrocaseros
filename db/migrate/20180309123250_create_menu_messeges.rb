class CreateMenuMesseges < ActiveRecord::Migration[5.1]
  def change
    create_table :menu_messeges do |t|
      t.string :messege
      t.boolean :start_messege
      t.boolean :last_messege

      t.timestamps
    end
  end
end
