require 'csv'
class AddGInventory < ActiveRecord::Migration
  def change
   create_table :generalinventories do |t|
     generalinventories = CSV.read(Dir.pwd + "/db/general_inventory.csv", :headers => true)
     generalinventories.each do |row|
     Inventory.create({
      :type => row[0],
      :staff => row[1],
      :upstairs => row[2],
      :trip_room => row[3],
      :nso_room => row[4],
      :rented => row[5],
      :in_pair => row[6],
      :total => row[7],
      :track_easy => row[8],
      :comparison => row[9],
      :notes => row[10]
      })
   end
   end

  
  end
end
