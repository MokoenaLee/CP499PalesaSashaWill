class Inventory < ActiveRecord::Base
  scope :all_it, -> {Inventory.all}
  has_many :rentals
  has_many :users, through: :rentals
  # has_many :users, :through => :rentals
  validates_presence_of :Gear_Type, :Size, :Gear_Category, :blahID
end
