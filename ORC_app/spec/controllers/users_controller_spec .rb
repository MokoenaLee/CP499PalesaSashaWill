require 'rails_helper'
require 'Factory_bot_rails'


RSpec.describe UsersController, :type => :controller do

 describe "it populates an array of new users" do
  it "creates a user" do
    @user = FactoryBot.build(:user)
    get :index
    assigns(:users).should eq([@user])
   end


 end
end
