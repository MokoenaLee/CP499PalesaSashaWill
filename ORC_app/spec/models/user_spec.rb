require 'rails_helper'
require 'factory_bot_rails'

 RSpec.describe User, :type => :model do
   
  describe 'creates new user' do
  
  before(:all) do
   @user1 = FactoryBot.build(:user)
  end

   it 'is valid with valid attributes' do
     expect(@user1).to be_valid
    end

   it "is not valid without first name" do
    user2 = FactoryBot.build(:user, first_name:nil)
    expect(user2).to_not be_valid
   end

  it "is not valid without last_name" do
   @user2 = FactoryBot.build(:user, last_name:nil)
   expect(@user2).to_not be_valid
  end


  it "is not valid without email_address" do
   @user2 = FactoryBot.build(:user, email_address:nil)
   expect(@user2).to_not be_valid
  end

  end
 end
