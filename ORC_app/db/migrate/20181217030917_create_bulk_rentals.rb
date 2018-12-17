class CreateBulkRentals < ActiveRecord::Migration
  def change
    create_table :bulk_rentals do |t|
      t.string :renter_first_name
      t.string :renter_last_name
      t.string :renter_email
      t.string :gear_type
      t.string :gear_category
      t.integer :Quantity
      t.string :rental_date
      t.string :return_date
      t.string :on_time_price

      t.timestamps null: false
    end
  end
end
