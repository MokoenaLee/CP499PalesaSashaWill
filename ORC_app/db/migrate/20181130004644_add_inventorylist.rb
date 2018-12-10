require 'csv'
class AddInventorylist < ActiveRecord::Migration
  def change
    inventories = CSV.read(Dir.pwd + "/db/itemized_inventory.csv", :headers => true)
    inventories.each do |row|

    Inventory.create({
      :Bulk => row[0],
      :Gear_Type => row[1],
      :Brand => row[2],
      :Size => row[3],
      :Serial_Number => row[4],
      :Date_Purchased => row[5],
      :Gear_Category => row[6],
      :Location => row[7],
      :Available => row[8],
      :Notes => row[9],
      :blahID => uniqueID(row[1].to_s, row[3].to_s, row[6].to_s, row[5].to_s)
      })
    end
  end

  def uniqueID(gt, s, gc, dp)
    otherobj = Inventory.where(Gear_Type: gt, Size: s).order(Gear_Type: :asc, Size: :asc).last
    year = dp.split("/")[2].split(//).last(2).join
    if(otherobj)
      currID = otherobj.blahID.split("-")[2]
      return "#{(gt.split.map(&:chr).join.upcase)+(gc[0].upcase)}-#{s}-#{currID.to_i+1}-#{year}"
    end
    else
      return "#{(gt.split.map(&:chr).join.upcase)+(gc[0].upcase)}-#{s}-1-#{year}"
    end
  end
