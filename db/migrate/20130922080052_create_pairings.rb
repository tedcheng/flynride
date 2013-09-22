class CreatePairings < ActiveRecord::Migration
  def change
    create_table :pairings do |t|
      t.integer :id
      t.integer :user1_id
      t.integer :user2_id
      t.string :phone_virtual

      t.timestamps
    end
  end
end
