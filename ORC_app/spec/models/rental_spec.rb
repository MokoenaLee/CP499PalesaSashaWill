require 'rails_helper'
require 'factory_bot_rails'

 RSpec.describe User, :type => :model do
   
  describe 'creates new rental' do
  
  before(:all) do
   @user1 = FactoryBot.build(:rental)
  end

   
 end
