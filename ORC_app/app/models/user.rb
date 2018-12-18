class User < ActiveRecord::Base
 
  has_many :rentals,:dependent => :destroy
  has_many :inventories, :through => :rentals
  accepts_nested_attributes_for :rentals, allow_destroy: true, reject_if: :all_blank
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email_address, presence: true
  
 
  
 
 #def self.all_filters
 # %w(student_ID)
 #end

 


 def self.return_options filt
   User.pluck(User.filt_as_col filt)
 end


 def self.find_where hash
  begin
   User.where(hash).to_a
  rescue ActiveRecord::RecordNotFound
   nil

  # has_many :inventories, :through => :rentals, :dependent => :destroy
  # belongs_to :rentals
  validates_presence_of :first_name, :last_name,:email_address, :student_ID, :phone
  has_many :rentals
  has_many :inventories, through: :rentals

#def send_instructions
  # NotifierMailer.instructions(self).deliver_now

  #end
 end

end
