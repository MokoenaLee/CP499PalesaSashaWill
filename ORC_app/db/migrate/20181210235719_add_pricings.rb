require 'csv'
#creates pricing model for on-time rentals. Price will be adjusted if latter
class AddPricings < ActiveRecord::Migration
  def change
      pricings = CSV.read(Dir.pwd + "/db/rental_pricing.csv", :headers => true)
      pricings.each do |row|

      Pricing.create({
      :Gear_Type => row[0],
      :daily => row[1],
      :weekly => row[2]
      })
     end

    end
  end
