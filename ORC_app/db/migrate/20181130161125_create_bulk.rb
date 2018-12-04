class CreateBulk < ActiveRecord::Migration
  def change
    create_table :bulks do |t|
      t.string 'Gear_Type'
      t.string 'Gear_Category'
      t.integer 'Quantity'
      t.string 'location'
      t.string 'Notes'
      t.boolean 'Bulk'
    end
  end
end
