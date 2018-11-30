require 'csv'
class AddItemized < ActiveRecord::Migration
  def change
    inventories = CSV.read(Dir.pwd + "/db/itemized.csv", :headers => true)
    inventories.each do |row|
     Itemized.create({
      :Gear_Type => row[0],
      :Brand => row[1],
      :Model => row[2],
      :Color => row[3],
      :Size => row[4],
      :Quantity => row[5],
      :Serial_Number => row[6],
      :Retail => row[7],
      :Purchase_Price => row[8],
      :Total_Spent => row[9],
      :Date_Purchased => row[10],
      :Purchase_Method =>      row[11],
      :Reason => row[12],
      :Gear_Category => row[13]
      })
  end
  end
end
