require 'csv'

class AddUserlist < ActiveRecord::Migration
  def change
    users = CSV.read(Dir.pwd + "/db/New_Fake_Users.csv", :headers => true)
    users.each do |row|
     User.create({
      :first_name => row[0],
      :last_name => row[1],
      :email_address => row[2],
      :student_ID => row[3],
      :phone => row[4]
      })
  end
  end
end
