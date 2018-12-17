require 'rails_helper'

#RSpec.feature "add new user", :type => :feature do
  
  feature 'a new user is created' do
   
    given!(:user){@user = FactoryBot.build(:user)}


   scenario 'create new user' do
    visit new_user_path

   click_button 'Add New User'

   fill_in 'First name', with: @user.email
   fill_in 'Last name', with: @user.last_name
   fill_in 'Student id', with: @user.student_id
   fill_in 'Gear type', with: @user.gear_type
   fill_in 'Rental date', with: @user.rental_date
   fill_in 'Return date', with: @user.return_date
   fill_in 'On Time Price', with: @user.on_time_price
   click_button 'Submit'

   expect(page).to have_content "Welcome! You have signed up successfully"

  
   end
  end
 


