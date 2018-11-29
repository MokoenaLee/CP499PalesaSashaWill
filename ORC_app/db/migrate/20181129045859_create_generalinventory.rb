class CreateGeneralinventory < ActiveRecord::Migration
  def change
    create_table :generalinventories do |t|
     t.string 'type'
     t.string 'staff'
     t.string 'upstairs'
     t.string 'trip_room'
     t.string 'nso_room'
     t.string 'rented'
     t.string 'in_pair'
     t.string 'total'
     t.string 'track_easy'
     t.string 'comparison'
     t.string 'notes'
   end

   
    end
  end
