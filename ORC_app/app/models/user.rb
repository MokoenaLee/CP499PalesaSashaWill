class User < ActiveRecord::Base
  has_many :inventories, :dependent => :destroy

  def send_instructions
   NotifierMailer.instructions(self).deliver_now
  end
  
end
