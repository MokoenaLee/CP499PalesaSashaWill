require 'csv'

class AddUserlist < ActiveRecord::Migration
  def change
    users = CSV.read(Dir.pwd + "/db/New_Fake_Users.csv", :headers => true)
    users.each do |row|
     User.create({
      :First_Name => row[0],
      :Last_Name => row[1],
      :Email_Address => row[2],
      :Student_ID => row[3], 
      :phone => row[4]
      })
   end
  end
end
