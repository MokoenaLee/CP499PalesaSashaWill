class Rental < ActiveRecord::Base
   belongs_to :users
   belongs_to :inventories
end
