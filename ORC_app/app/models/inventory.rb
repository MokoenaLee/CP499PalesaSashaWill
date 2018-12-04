class Inventory < ActiveRecord::Base
  scope :all_it, -> {Inventory.all}
  has_many :rentals
  has_many :users, :through => :rentals
>>>>>>> 1a2f5e3b04ba0667edc5ad5c969916d5d4e227ac
end
