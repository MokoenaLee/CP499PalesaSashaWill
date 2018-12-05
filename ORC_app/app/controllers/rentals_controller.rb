class RentalsController < ApplicationController
  before_action :set_rental, only: [:show, :edit, :update, :destroy]
  # GET /rentals
  # GET /rentals.json
  def index
    @rentals = Rental.all
  end

  # GET /rentals/1
  # GET /rentals/1.json
  def show
  end

  # GET /rentals/new
  def new
    @user_fname = User.all.map{|u| u.first_name}
    @user_lname = User.all.map{|x| x.last_name}
    @inventory_gear = Inventory.all.map{|t| t.Gear_Type}
    @inventory_model = Inventory.all.map{|t| t.Model}
    @inventory_brand = Inventory.all.map{|t| t.Brand}
    
    
    # @user_options.order(:last_name, :asc)
    @rental = Rental.new

  end

  # GET /rentals/1/edit
  def edit
  end
 
  def index
   results = nil
   
   case params[:commit]
   when 'Clear'
    clear_sessions_of_filters
    redirect_to rentals_path
   when 'Search'
    results = filter_rentals
    store_filter_in_session
    if results.nil? || results.empty?
     flash[:warning] = "no courses found"
    end
   end
   @rentals = results.nil? || Rental.all : results
  end

  private 
  def filter_rentals
    filter = {}
    Rental.all_filters do |filt|
     if !(params[filt].nil? || params[filt].empty?)
       filter[filt_as_col filt] = params[filt]
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

    respond_to do |format|
      if @rental.save
        format.html { redirect_to @rental, notice: 'Rental was successfully created.' }
        format.json { render :show, status: :created, location: @rental }
      else
        format.html { render :new }
        format.json { render json: @rental.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rentals/1
  # PATCH/PUT /rentals/1.json
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rental
      @rental = Rental.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rental_params
      params.require(:rental).permit(:user_ID,:first_name,:last_name,:Gear_Type,:Model,:Brand,:rental_date, :return_date,:days_used, :on_time_price)
    end
end
