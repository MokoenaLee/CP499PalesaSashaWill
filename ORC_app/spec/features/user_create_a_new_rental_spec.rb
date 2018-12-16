require 'rails_helper'

RSpec.feature "add new user with rental", :type => :feature do
 scenario "employee adds new user" do
  visit "/users/new"

   fill_in "users[First Name]", with: "Bob"
   fill_in "Last Name", with: "Marks" 
   fill_in "email address " ,with: "b@coloradocollege.edu"
   fill_in "Gear Type " ,with: "WetSuit"
   fill_in "Rental date" ,with: "12/3/2018"
   fill_in "Return date" ,with: "12/4/2018"
   fill_in "Days used" ,with: "1"
   fill_in "On time price" ,with: "2.00"
   click_button "Submit"

   expect(page).to have_field( "First Name", with: "Bob")
   expect(page).to have_field("Last Name", with: "Marks")
   expect(page).to have_field("email address ", with: "b@coloradocollege.edu")
   expect(page).to have_field("Gear Type", with: "WetSuit")
   
   expect(page).to have_field("Rental date",with: "12/3/2018")
   expect(page).to have_field("Return date", with: "12/4/2018")
   expect(page).to have_field("Days used", with: "1")
   expect(page).to have_field("On time price", with: "2.00")
 end
end

