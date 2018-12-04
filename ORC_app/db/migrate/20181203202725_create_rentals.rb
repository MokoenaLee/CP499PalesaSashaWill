class CreateRentals < ActiveRecord::Migration
  def change
    create_table :rentals do |t|
      t.integer :user_ID
      t.string :Gear_Type
      t.string :rental_date
      t.string :return_date
      t.integer :days_used
      t.string :on_time_price

      t.timestamps null: false
    end
  end
end
