class User < ActiveRecord::Base
  has_many :inventories, :dependent => :destroy
  
end
