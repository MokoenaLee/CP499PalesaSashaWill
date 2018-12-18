class User < ActiveRecord::Base
  # has_many :inventories, :through => :rentals, :dependent => :destroy
  # belongs_to :rentals
  validates_presence_of :first_name, :last_name,:email_address, :phone
  has_many :rentals
  has_many :inventories, through: :rentals
def send_instructions
   NotifierMailer.instructions(self).deliver_now
  end

end
