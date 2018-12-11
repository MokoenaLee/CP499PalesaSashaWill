require 'rails_helper'
require 'factory_bot_rails'

 RSpec.describe User, :type => :model do
   user = FactoryBot.build(:user)

   it 'sends an email' do
     expect{user.send_instructions}
      .to change{ActionMailer::Base.deliveries.count}.by(1)
   end
 end
