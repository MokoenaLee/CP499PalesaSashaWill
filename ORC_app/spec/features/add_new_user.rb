require 'rails_helper'

#RSpec.feature "add new user", :type => :feature do
  
  feature 'a new user is created' do
   
    given!(:user){@user = FactoryBot.build(:user)}


   scenario 'create new user' do
    visit new_user_path

   click_button 'Add New User'

   fill_in 'First name', with: @user.first_name
   fill_in 'Last name', with: @user.last_name
   fill_in 'Email address', with: @user.email
   fill_in 'iclass', with: @user.iclass
   
   click_button 'Submit'

   expect(page).to have_content "user added successfully"

  
   end
  end
 


