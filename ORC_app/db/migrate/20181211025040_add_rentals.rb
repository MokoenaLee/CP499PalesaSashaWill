require 'csv'
class AddRentals < ActiveRecord::Migration
  def change
    rentals = CSV.read(Dir.pwd + "/db/rental_inventory.csv", :headers => true)
     rentals.each do |row|
      Rental.create({
      :renter_ID => row[0],
      :first_name => row[1],
      :last_name => row[2],
      :email_address => row[3],
      :Gear_Type => row[4],
      :rental_date => row[5],
      :days_used => row[6],
      :return_date => row[7],
      :on_time_price => row[8]
      })
    end
  end
end
