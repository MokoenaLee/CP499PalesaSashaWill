class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
     t.string 'first_name'
     t.string 'last_name'
     t.string 'email_address'
     t.string 'phone'
     t.integer 'iclass'
    end
  end
end
