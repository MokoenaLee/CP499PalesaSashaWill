require 'rails_helper'
  
  feature 'user signs in' do
   
    given!(:administrator){@administrator = FactoryBot.build(:administrator)}


   scenario 'with valid credentials' do
    visit new_administrator_session_path

   click_link 'Sign up'

   fill_in 'Email', with: @administrator.email
   fill_in 'Password', with: @administrator.password
   fill_in 'Password confirmation', with: @administrator.password_confirmation
   click_button 'Sign up'

   expect(page).to have_content "Welcome! You have signed up successfully"
   expect(@administrator.password.length).to eq(rlength)
  
   end

  scenario 'password legnth too short' do
    visit new_administrator_registration_path
     
   fill_in 'Email', with: @administrator.email
   fill_in 'Password', with: "Rat12"
   fill_in 'Password confirmation', with: "Rat12"
  
   click_button 'Sign up'
   
   expect(page).to have_content "1 error prohibited this administrator from being saved: Password confirmation does not match"
   expect(@administrator.password.size).not_to eq(rlength)

  end 
  end
 


