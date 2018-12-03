class CreateBulk < ActiveRecord::Migration
  def change
    create_table :bulks do |t|
      t.string 'gear_type'
      t.string 'gear_category'
      t.string 'quantity'
      t.string 'notes'
      t.boolean 'bulk'
    end
  end
end
