require 'csv'
class AddUserlist < ActiveRecord::Migration
  def change
    users = CSV.read("/Users/lfcarney/Downloads/ORC_app/db/studentsorc.csv", :headers => false, :encoding => 'ISO-8859-1')
    users.each do |row|
     User.create({
      :first_name => row[1],
      :last_name => row[2],
      :email_address => row[0],
      :iclass => row[3].to_i
      })
  end
  end
end
