require 'uri'
class User < ActiveRecord::Base
 
  has_many :rentals,:dependent => :destroy
  has_many :inventories, :through => :rentals
  accepts_nested_attributes_for :rentals, allow_destroy: true, reject_if: :all_blank
  validates_presence_of :first_name, :last_name,:email_address, :student_ID, :phone
  #validates :email_address, format: {with: URI::MailTo::EMAIL_REGEXP}
 
  

 


 

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


 def self.return_options filt
   User.pluck(User.filt_as_col filt)
 end


end
