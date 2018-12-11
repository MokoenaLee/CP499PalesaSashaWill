class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users,id: false do |t|
     t.integer 'renter_ID'
     t.string 'first_name'
     t.string 'last_name'
     t.string 'email_address'
     t.string 'student_ID'
     t.string 'phone'
    end
  end
end
