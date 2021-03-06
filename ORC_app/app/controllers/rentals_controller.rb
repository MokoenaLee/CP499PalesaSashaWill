class RentalsController < ApplicationController
  before_action :set_rental, only: [:show, :edit, :update, :destroy, :errPopup]

  def index
    @rentals = Rental.all
  end

  def show
  end


  def new
    @user_fname = User.all.map{|u| u.first_name}
    @user_lname = User.all.map{|x| x.last_name}
    @inventory_gear = Inventory.all.map{|t| t.Gear_Type}
    @rental = Rental.new
  end


  def edit
    get_gear_type
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
    get_gear_type

    generate_rental_price
    respond_to do |format|
      if @rental.save
        puts "rental email address"
        puts @rental.email_address
        # RentalMailer.rental_confirmation(@rental).deliver_now
        format.html { redirect_to @rental, notice: 'Rental was successfully created.' }
        format.json { render :show, status: :created, location: @rental }
      else
        format.html { render :new }
        format.json { render json: @rental.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    # generate_rental_price
    get_gear_type
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
    # gear_type = @rental.Gear_Type.downcase.titleize
    days_used = @rental.days_used.to_f
    parsefile = @rental.blahID.split(".png")[0]
    @rental.blahID = parsefile
    gear_type = Inventory.where(blahID: parsefile).last.Gear_Type
    if days_used < 5
      if(!Pricing.where(Gear_Type: gear_type))

      end
      working_price = days_used*(Pricing.select(:daily).where(Gear_Type: gear_type).last.daily.to_i)
      @rental.on_time_price = '$'+ working_price.to_s
      @rental.save
    else
      if days_used%7 != 0
        temp = (days_used/7).floor
        @rental.on_time_price = (temp*(Pricing.select(:weekly).where(Gear_Type: gear_type).last.weekly.to_i)) + ((days_used-(temp*7))*(Pricing.select(:daily).where(Gear_Type: gear_type).last.daily.to_i))
        @rental.save

      else
        weeks = (days_used/7)
        working_price = weeks*(Pricing.select(:weekly).where(Gear_Type: gear_type).last.weekly.to_i)
        @rental.on_time_price = '$'+ working_price.to_s
        @rental.save
      end
    end
  end
  helper_method :generate_rental_price

  def get_gear_type
    tempID = @rental.blahID.split(".png")[0]
    @rental.blahID = tempID
    if(tempID)
      @rental.Gear_Type = Inventory.where(blahID: tempID).last.Gear_Type
      @rental.save
    end
  end

  def errPopup
    closesttype = Rental.errPopup
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rental
      @rental = Rental.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rental_params
                  params.require(:rental).permit(:user_ID,:first_name,:last_name,:email_address,:blahID, :Gear_Type,:Model,:Brand,:rental_date, :return_date,:days_used, :on_time_price)
    end
end
