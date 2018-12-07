class SearchesController < ApplicationController

  def index

  end
  
 
  def search 
    rentals = []
    if params[:search_filters] = "first_name"
      result = Rental.find_rental_by_username(params[:s])
      rentals << result if !result.nil?
    end
   puts "checking what's in params>>>>>>"
   puts params[:s]
   
   if rentals.empty?
     flash[:warning] = "No rentals by user found"
     redirect_to '/search'
   else
     redirect_to(:controller => "rentals", :action => "index", :results => rentals)
   end
  end


end
