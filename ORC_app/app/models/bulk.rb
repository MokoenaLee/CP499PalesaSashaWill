class Bulk < ActiveRecord::Base
  scope :all_bulk, -> {Bulk.all}
end
