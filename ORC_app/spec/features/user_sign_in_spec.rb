require 'rails_helper'

#RSpec.feature "add new user", :type => :feature do
  
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

  
   end

 # scenario 'with invalid credentials' do
    #visit new_administrator_session_path
     
   #fill_in 'Email', with: @administrator.email
   #fill_in 'Password', with: @administrator.password
   #fill_in 'Password confirmation', with: @administrator.password_confirmation_empt
   #click_button 'Sign up'

   #expect(page).to have_content "1 error prohibited this administrator from being saved: Password confirmation doesn't match Password"

 # end 
  end
 


