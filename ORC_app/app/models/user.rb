class User < ActiveRecord::Base
  has_many :rentals
  has_many :inventories, :through => :rentals, :dependent => :destroy
  accepts_nested_attributes_for :rentals
  self.primary_key = "renter_ID"


  def send_instructions
   NotifierMailer.instructions(self).deliver_now
  end

end
