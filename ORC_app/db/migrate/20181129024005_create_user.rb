class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
     t.string 'First_Name'
     t.string 'Last_Name'
     t.string 'Email_Address'
     t.string 'Student_ID'
     t.string 'phone'
    end
  end
end
