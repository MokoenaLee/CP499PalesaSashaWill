require 'csv'
class AddInventorylist < ActiveRecord::Migration
  def change
    inventories = CSV.read(Dir.pwd + "/db/itemized_inventory.csv", :headers => true)
    inventories.each do |row|
     Inventory.create({
      :Bulk => row[0],
      :Gear_Type => row[1],
      :Brand => row[2],
      :Model => row[3],
      :Color => row[4],
      :Size => row[5],
      :Quantity => row[6],
      :Serial_Number => row[7],
      :Retail => row[8],
      :Purchase_Price => row[9],
      :Total_Spent => row[10],
      :Date_Purchased => row[11],
      :Purchase_Method =>      row[12],
      :Reason => row[13],
      :Gear_Category => row[14],
      :Available => row[15]
      })
    end
  end

  def createIID
  
  end
end
