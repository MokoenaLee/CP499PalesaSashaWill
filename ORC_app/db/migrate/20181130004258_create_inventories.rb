class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
       t.boolean 'Bulk'
       t.string 'Gear_Type'
       t.string 'Brand'
       t.string 'Model'
       t.string 'Color'
       t.string 'Size'
       t.string 'Quantity'
       t.string 'Serial_Number'
       t.string 'Retail'
       t.string 'Purchase_Price'
       t.string 'Total_Spent'
       t.string 'Date_Purchased'
       t.string 'Purchase_Method'
       t.string 'Reason'
       t.string 'Gear_Category'
       t.string 'Available'
     end
  end
end
