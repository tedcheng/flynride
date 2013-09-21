class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.integer :id
      t.string :flight_no
      t.date :date

      t.timestamps
    end
  end
end
