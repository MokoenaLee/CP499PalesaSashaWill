class User < ActiveRecord::Base
  has_many :inventories, :through => :rentals

end
