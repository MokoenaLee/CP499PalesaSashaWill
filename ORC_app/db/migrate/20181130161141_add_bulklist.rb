require 'csv'
class AddBulklist < ActiveRecord::Migration
  def change
    bulks = CSV.read(Dir.pwd + "/db/bulk_inventory.csv", :headers => true)
    bulks.each do |row|
      Bulk.create({
       :Gear_Type => row[0],
       :Gear_Category => row[1],
       :Quantity => row[2],
       :location => row[3],
       :Notes => row[4],
       :Bulk => row[5]})
    end
  end
end
