class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
       t.string 'blahID', :null => FALSE
       t.boolean 'Bulk'
       t.string 'Gear_Type'
       t.string 'Brand'
       t.string 'Size'
       t.string 'Serial_Number'
       t.string 'Date_Purchased'
       t.string 'Gear_Category'
       t.string 'Location'
       t.boolean 'Available'
       t.string 'Notes'
     end
  end
end
