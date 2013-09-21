class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :id
      t.string :phone_no

      t.timestamps
    end
  end
end
