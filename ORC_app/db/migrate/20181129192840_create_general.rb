class CreateGeneral < ActiveRecord::Migration
  def change
    create_table :generals do |t|
      t.string 'type_name'
      t.string 'staff'
      t.string 'date'
      t.string 'upstairs'
      t.string 'trip_room'
      t.string 'nso_room'
      t.string 'rented'
      t.string 'in_repair'
      t.string 'total'
      t.string 'track_easy'
      t.string 'comparison'
      t.string 'notes'
    end
  end
end
