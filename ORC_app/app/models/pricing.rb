#model for pricing model which calculates on-time prices based on days_used
class Pricing < ActiveRecord::Base
  belongs_to :rentals
end
