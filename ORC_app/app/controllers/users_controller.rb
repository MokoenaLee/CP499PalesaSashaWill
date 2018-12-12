class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end


  #def new
    #@users  = User.find_where(params[:student_ID])
    #puts "In the other new method"
    #results = nil
    #puts "before commit"
    #if params[:commit] == "Find"
      #results = filter_users
      #puts "in the Find case"
      #if results.nil? || results.empty?
       #  flash[:warning] = "No student with that ID found"
      #end
    #else 
      # redirect_to new_rental 
    #end 
  # @users = results.nil? ? User.all : results
   #puts "users"
   #puts @users
  #end
 

  def edit
  end
  
 # def filter_users
     #filter = {}
     #puts "in user filter"
     #User.all_filters.each do |filt|
        #if !(params[filt].nil? || params[filt].empty?)
           #filter[User.filt_as_col filt] = params[filt]
        #end
    # puts filter
     #end
     #return User.find_where filter
     #puts "user find where"
     #puts User.find_where filter
  #end
  

  def create
    @user = User.new(user_params)
   

    respond_to do |format|
      if @user.save
        UserMailer.rental_confirmation(@user).deliver_now
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
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
      puts "what is in params[:id]"
      puts params[:id]
      @user = User.find(params[:id])
      
    end

    #returns a table row
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:user_ID,:first_name, :last_name,:email_address, :student_ID, :phone, rentals_attributes: [:Gear_Type, :id], )
    end
end
