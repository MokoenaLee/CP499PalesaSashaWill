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
      :Available => row[15],
      :blahID => primary_key(row[1].to_s, row[5].to_s, row[14].to_s, row[11].to_s),

      })
    end
  end

  def primary_key(gt, s, gc, dp)
    otherobj = Inventory.where(Gear_Type: gt, Size: s).order(Gear_Type: :asc, Size: :asc).last
    year = dp.split("/")[2].split(//).last(2).join
    if(otherobj)
      currID = otherobj.blahID.split("-")[2]
      return "#{(gt.split.map(&:chr).join.upcase)+(gc[0].upcase)}-#{s}-#{currID.to_i+1}-#{year}"
    end
    else
      puts "#{(gt.split.map(&:chr).join.upcase)+(gc[0].upcase)}-#{s}-1-#{year}"
      return "#{(gt.split.map(&:chr).join.upcase)+(gc[0].upcase)}-#{s}-1-#{year}"
    end
  end
