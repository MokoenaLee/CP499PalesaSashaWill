class AddInvenRefToRentals < ActiveRecord::Migration
  def change
    add_reference :rentals, :inventory, index: true, foreign_key: true
  end
end
