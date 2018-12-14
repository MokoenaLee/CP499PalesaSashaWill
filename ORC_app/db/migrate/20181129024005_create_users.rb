class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
     t.string 'first_name'
     t.string 'last_name'
     t.string 'email_address'
     t.string 'student_ID'
     t.string 'phone'
     t.string 'rentals_attributes'
    end
  end
end
