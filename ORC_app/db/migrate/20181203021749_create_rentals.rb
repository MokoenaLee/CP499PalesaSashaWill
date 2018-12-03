class CreateRentals < ActiveRecord::Migration
  def change
    create_table :rentals do |t|
      t.string  'Renter_Fname'
      t.string  'Renter_Lname'
      t.string  'Gear_type'
      t.string  'Brand'
      t.string  'Model'
      t.string  'Color'
      t.string  'Size'
      t.string  'Quantity'
      t.date    'Date'
    end
  end
end
