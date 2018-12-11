require 'csv'
require 'barby'
require 'barby/barcode/code_39'
require 'barby/outputter/png_outputter'
class AddInventorylist < ActiveRecord::Migration
  def change
    inventories = CSV.read(Dir.pwd + "/db/itemized_inventory.csv", :headers => true)
    inventories.each do |row|
      tempSize = row[3]
      if tempSize == "N/A"
        tempSize = "0"
      end

    @inventory = Inventory.create({
      :Bulk => row[0],
      :Gear_Type => row[1],
      :Brand => row[2],
      :Size => tempSize,
      :Serial_Number => row[4],
      :Date_Purchased => row[5],
      :Gear_Category => row[6],
      :Location => row[7],
      :Available => row[8],
      :Notes => row[9],
      :blahID => uniqueID(row[1].to_s, row[3].to_s, row[6].to_s, row[5].to_s)
      })
      generate_barcodes
    end
  end

  def uniqueID(gt, s, gc, dp)
    otherobj = Inventory.where(Gear_Type: gt, Size: s).order(Gear_Type: :asc, Size: :asc).last
    year = dp.split("/")[2].split(//).last(2).join
    if(otherobj)
      currID = otherobj.blahID.split("-")[2]
      return "#{(gt.split.map(&:chr).join.upcase)+(gc[0].upcase)}-#{s}-#{currID.to_i+1}-#{year}"
    else
      return "#{(gt.split.map(&:chr).join.upcase)+(gc[0].upcase)}-#{s}-1-#{year}"
    end
  end
  def generate_barcodes # check to see if we don't already have this barcode image uri = CGI.escape(symbology) + '_' + CGI.escape(data) + '.jpg' fname = RAILS_ROOT + '/public/Barcodes/' + uri #fname = '/var/www/html/arc_cloud/arcdevelopment/' + uri
    fnsku = @inventory.blahID + ".png"
    fname = File.join(Rails.root, "public/Barcodes/", fnsku)
    barcode = Barby::Code39.new(fnsku, true)
    File.open( fname, 'wb'){|f| f.write barcode.to_png(:height => 40, :margin => 3)}
  end
end
