class UsersController < ApplicationController
  before_action :authenticate_administrator!
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

 
 def show
 end

  def new
    @user = User.new
    3.times {@user.rentals.build} #does not create a rental id even though it associates a user with  rental
    
  end


  def edit
   @user.rentals.build
  end

  

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if valid_email?(@user.email_address)
        @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        flash.keep(:notice)
        flash[:notice] = "Oops! Something went wrong with one or more of the fields. Make sure inputs are valid"
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end



  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

 
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


    # Use callbacks to share common setup or constraints between actions.
    def set_user
      puts params[:id]
      @user = User.find(params[:id])
      
    end

    def valid_email?(email)
    
     email.present? && (email =~ /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i) && Rental.find_rental_by_username(:email_address => email).empty? 
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      return params.require(:user).permit(:user_ID,:first_name, :last_name,:email_address, :student_ID, :phone, rentals_attributes: [:id,:_destroy,:Gear_Type, :rental_date, :return_date, :days_used, :on_time_price])
    end
end
