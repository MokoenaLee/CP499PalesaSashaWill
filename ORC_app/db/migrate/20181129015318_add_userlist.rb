require 'csv'

class AddUserlist < ActiveRecord::Migration
  def change
   users = courses = CSV.read(Dir.pwd + "/db/user.csv", :headers => true)
   users.each do |row|
   User.create({
      :name => row[0]
      :email => row[1]
      :ccid => row[2]
      :phone_number => row[3]
      :leader_level => row[4]
      :discount => row[5]
   
    })
  end
end
