class CreatePricings < ActiveRecord::Migration
  def change
    create_table :pricings do |t|
      t.string 'Gear_Type'
      t.string 'daily'
      t.string 'weekly'
      t.string 'blah'
    end
  end
end