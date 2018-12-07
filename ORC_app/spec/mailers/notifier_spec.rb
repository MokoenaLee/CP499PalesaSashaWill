require 'rails_helper'

RSpec.describe NotifierMailer, :type => :mail do
  describe 'instructions' do
   let(:user) {mock_model User, name: 'Palesa', email: 'Palesa@gmail.com'}
   let(:mail){described_class.instructions(user).deliver_now}


   it 'renders the subject' do
     expect(mail.subject).to eq('Rental confirmed')
   end

  it 'renders the receiver email' do
    expect(mail.to).to eq([user.email])
  end

  it 'renders the sender email' do
    expect(mail.from).to eq(["leeann.mokoena@gmail.com"])
  end
 end
end

