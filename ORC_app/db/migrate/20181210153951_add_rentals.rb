require 'csv'
#Price is filled dynamically so it has been taken away as a CSV assigned field
class AddRentals < ActiveRecord::Migration
  def change
     rentals = CSV.read(Dir.pwd + "/db/rental_inventory.csv", :headers => true)
     rentals.each do |row|
      Rental.create({
      :first_name => row[0],
      :last_name => row[1],
      :email_address => row[2],
      :iclass => row[3],
      :blahID => row[4],
      :Gear_Type => row[5],
      :rental_date => row[6],
      :days_used => row[7],
      :return_date => row[8]
      })
    end
  end
 end
