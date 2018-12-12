class User < ActiveRecord::Base
  has_many :rentals
  has_many :inventories, :through => :rentals, :dependent => :destroy
  #self.primary_key = "renter_ID"
  #accepts_nested_attributes_for :rentals


  def send_instructions
   NotifierMailer.instructions(self).deliver_now
  end
 
 def self.all_filters
  %w(student_ID)
 end


  def self.filt_as_col filt
   if filt == "student_ID"
    return :student_ID
   else 
    return 
   end
 end

 def self.return_options filt
   User.pluck(User.filt_as_col filt)
 end


 def self.find_where hash
  begin
   User.where(hash).to_a
  rescue ActiveRecord::RecordNotFound
   nil
  end
 end

end
