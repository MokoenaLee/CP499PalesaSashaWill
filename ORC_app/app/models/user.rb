class User < ActiveRecord::Base
  attr_accessor :rentals_attributes
  has_many :rentals, :dependent => :destroy
  #has_many :inventories #:through => :rentals, :dependent => :destroy
  accepts_nested_attributes_for :rentals, allow_destroy: true, reject_if: :all_blank
 


  def send_instructions
   NotifierMailer.instructions(self).deliver_now
  end
 
 def self.all_filters
  %w(student_ID)
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
