class User < ActiveRecord::Base
  # has_many :inventories, :through => :rentals, :dependent => :destroy
  # belongs_to :rentals
  has_many :rentals 
  has_many :inventories, through: :rentals
def send_instructions
   NotifierMailer.instructions(self).deliver_now
  end

end
