class Inventory < ActiveRecord::Base
  scope :all_it, -> {Inventory.all}
  #has_many :rentals
  #has_many :users, :through => :rentals
  #belongs_to :users

  has_many :rentals
  has_many :users, through: :rentals
  # has_many :users, :through => :rentals

end
