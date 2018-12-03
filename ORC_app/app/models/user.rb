class User < ActiveRecord::Base
  has_many :rentals
  has_many :inventories, :through => :rentals
end
