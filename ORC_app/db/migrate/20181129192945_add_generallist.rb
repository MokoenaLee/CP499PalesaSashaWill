require 'csv'
class AddGenerallist < ActiveRecord::Migration
  def change
    inventories = CSV.read(Dir.pwd + "/db/general_inventory.csv", :headers => true)
    inventories.each do |row|
    General.create({
      :type_name => row[0],
      :staff => row[1],
      :date => row[2],
      :upstairs => row[3],
      :trip_room => row[4], 
      :nso_room => row[5],
      :rented => row[6],
      :in_repair => row[7],
      :total => row[8],
      :track_easy => row[9],
      :comparison => row[10],
      :notes =>      row[11]
      })
  end
  end
end
