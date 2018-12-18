class Bulk < ActiveRecord::Base
  scope :all_bulk, -> {Bulk.all}
  validates_presence_of :Gear_Type, :Gear_Category,:Quantity
end
