class CreateVisitsCounters < ActiveRecord::Migration[5.1]
  def change
    create_table :visits_counters do |t|
      t.integer :home
      t.integer :menu
      t.integer :contact
      t.integer :galery

      t.timestamps
    end
  end
end
