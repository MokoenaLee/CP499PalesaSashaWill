require 'csv'
class CreateAddrentals < ActiveRecord::Migration
  def change
    create_table :addrentals do |t|
     rentals = CSV.read(Dir.pwd + "/db/rental_inventory.csv", :headers => true)
     rentals.each do |row|
      Rental.create({
      :first_name => row[0],
      :last_name => row[1],
      :email_address => row[2],
      :Gear_Type => row[3],
      :rental_date => row[4],
      :days_used => row[5],
      :return_date => row[6],
      :on_time_price => row[7]
      })
    end
  end
 end
end
