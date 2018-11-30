class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.string :gear_type
      t.string :brand
      t.string :model
      t.string :color
      t.string :size
      t.string :serial_number
      t.string :retail
      t.string :purchase_price
      t.string :total_spent
      t.string :date_purchaseed
      t.string :purchase_method
      t.text :reason
      t.string :gear_category
      t.boolean :available
      t.boolean :bulk

      t.timestamps null: false
    end
  end
end
