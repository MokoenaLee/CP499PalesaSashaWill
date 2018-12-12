class RentalsController < ApplicationController
  before_action :set_rental, only: [:show, :edit, :update, :destroy]

  def index
    @rentals = Rental.all
  end

  def show
  end


  def new
    #code for when we used drop downs to select options
    @user_fname = User.all.map{|u| u.first_name}
    @user_lname = User.all.map{|x| x.last_name}
    @inventory_gear = Inventory.all.map{|t| t.Gear_Type}
    @rental = Rental.new
  end

  
  def edit
    generate_rental_price
  end

  def index
    results = nil

    case params[:commit]
    when "Clear"
      clear_sessions_of_filters
      redirect_to rentals_path
      return
   when "Search"
      results = filter_rentals
      store_filter_in_session
      puts "in the rental controller in search"
      puts results
      if results.nil? || results.empty?
        flash[:warning] = "No rentals found"
      end
    end

   @rentals = results.nil? ? Rental.all : results

  end


  def filter_rentals
     filter = {}
     Rental.all_filters.each do |filt|
        if !(params[filt].nil? || params[filt].empty?)
           filter[Rental.filt_as_col filt] = params[filt]
        end
     puts filter
     end
     return Rental.find_where filter
  end


  def clear_sessions_of_filters
   Rental.all_filters do |filt|
    session.delete filt
   end
  end



  def store_filter_in_session
   Rental.all_filters do |filt|
    if !params[filt].nil?
      session[filt] = params[filt]
    end
   end

  end
  
  
  def create
    @rental = Rental.new(rental_params)
    generate_rental_price
    respond_to do |format|
      if @rental.save
        #RentalMailer.rental_confirmation(@rental).deliver_now
        format.html { redirect_to @rental, notice: 'Rental was successfully created.' }
        format.json { render :show, status: :created, location: @rental }
      else
        format.html { render :new }
        format.json { render json: @rental.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @rental.update(rental_params)
        format.html { redirect_to @rental, notice: 'Rental was successfully created.' }
        format.json { render :show, status: :ok, location: @rental }
      else
        format.html { render :edit }
        format.json { render json: @rental.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @rental.destroy
    respond_to do |format|
      format.html { redirect_to rentals_url, notice: 'Rental was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def generate_rental_price
    gear_type = @rental.Gear_Type.downcase.titleize
    days_used = @rental.days_used.to_f
    puts "days used"
    puts days_used
    if days_used < 5
      working_price = days_used*(Pricing.select(:daily).where(Gear_Type: gear_type).last.daily.to_i)
      @rental.on_time_price = '$'+ working_price.to_s
    else
      if days_used%7 != 0
        temp = (days_used/7).floor
        @rental.on_time_price = (temp*(Pricing.select(:weekly).where(Gear_Type: gear_type).last.weekly.to_i)) + ((days_used-(temp*7))*(Pricing.select(:daily).where(Gear_Type: gear_type).last.daily.to_i))

      else
        weeks = (days_used/7)
        working_price = weeks*(Pricing.select(:weekly).where(Gear_Type: gear_type).last.weekly.to_i)
        @rental.on_time_price = '$'+ working_price.to_s
      end
    end
  end
  helper_method :generate_rental_price

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rental
      @rental = Rental.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rental_params
                  params.require(:rental).permit(:user_ID,:renter_ID,:first_name,:last_name,:email_address,
:Gear_Type,:Model,:Brand,:rental_date, :return_date,:days_used, :on_time_price)
    end
end
