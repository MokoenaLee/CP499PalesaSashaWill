require 'csv'

class AddUserlist < ActiveRecord::Migration
  def change
    users = CSV.read(Dir.pwd + "/db/New_Fake_Users.csv", :headers => true)
    users.each do |row|
     User.create({
      :renter_ID => row[0],
      :first_name => row[1],
      :last_name => row[2],
      :email_address => row[3],
      :student_ID => row[4],
      :phone => row[5]
      })
  end
  end
end
