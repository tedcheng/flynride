class CreateRiders < ActiveRecord::Migration
  def change
    create_table :riders do |t|
      t.integer :id
      t.integer :user_id
      t.integer :flight_id
      t.string :final_dest

      t.timestamps
    end
  end
end
