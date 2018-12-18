class CreateRentals < ActiveRecord::Migration
  def change
    create_table :rentals do |t|
      t.string :first_name
      t.string :last_name
      t.string :email_address
      t.integer :iclass
      t.string :blahID
      t.string :Gear_Type
      t.string :rental_date
      t.integer :days_used
      t.string :return_date
      t.string :on_time_price
      t.integer :daily_price
      t.integer :weekly_price
      t.timestamps null: false
    end

    add_index :rentals, :blahID
    add_index :rentals, :iclass
  end
end
