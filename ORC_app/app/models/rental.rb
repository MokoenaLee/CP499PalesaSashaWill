class Rental < ActiveRecord::Base
   belongs_to :users
   belongs_to :inventories

#Validations to the model
  validates :first_name ,presence: true
  validates :last_name, presence: true
  

   def send_instructions(user)
    NotifierMailer.instructions(self).deliver_now
   end

  def self.find_rental_by_username username
    begin
      Rental.find_by_username(username)
    rescure ActiveRecord::RecordNotFound
      nil
    end
  end


 def self.all_filters
  %w(first_name last_name)
 end
   

 def self.filt_as_col filt
   case filt
   when "first_name"
    return :first_name
   when "last_name"
    return :last_name
   end
 end

 def self.return_options filt
   Rental.pluck(Rental.filt_as_col filt)
 end

 def self.find_where hash
  begin
   Rental.where(hash).to_a
  rescue ActiveRecord::RecordNotFound
   nil
  end
 end


 def self.find_by_username username
  begin
   Rental.where(username).to_a
  rescue ActiveRecord::RecordNotFound
   nil
  end
 end

end
