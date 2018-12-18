class BulkRental < ActiveRecord::Base
    scope :all_bulk_rental, -> {BulkRental.all}
end
