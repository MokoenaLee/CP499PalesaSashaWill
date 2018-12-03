require 'csv'
class AddBulklist < ActiveRecord::Migration
  def change
    bulks = CSV.read(Dir.pwd + "/db/bulk_inventory.csv", :headers => true)
    bulks.each do |row|
      Bulk.create({
       :gear_type => row[0],
       :gear_category => row[1],
       :quantity => row[2],
       :notes => row[3],
       :bulk => row[4]})
    end
  end
end
