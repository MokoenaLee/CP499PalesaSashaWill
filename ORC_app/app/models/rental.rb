class Rental < ActiveRecord::Base
   belongs_to :users
   belongs_to :inventories



  def self.find_rental_by_username username
    begin
      Rentals.find_by_username(username)
    rescure ActiveRecord::RecordNotFound
      nil
    end
  end

 def self.all_filters
  %w(First_Name Last_Name)
 end
   

 def self.filt_as_col filt
   case filt
   when "First_Name"
    return :first_name
   when "Last_Name"
    return :last_name
   end
 end

 def self.unique_options filt
   Rental.uniq.pluck(Rental.filt_as_col filt)
 end

 def self.find_where hash
  begin
   Rental.where(hash).to_a
  rescue ActiveRecord::RecordNotFound
   nil
  end
 end


end
