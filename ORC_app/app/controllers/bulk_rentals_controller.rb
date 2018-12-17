class BulkRentalsController < ApplicationController
    before_action :authenticate_administrator!
    before_action :set_bulk_rental, only: [:show, :edit, :update, :destroy]

    # GET /bulk_rentals/1
    # GET /bulk_rentals/1.json
    def show
    end

    # GET /bulk_rentals/new
    def new
       @bulk_rental = BulkRental.new

    end

    # GET /bulk_rentals/1/edit
    def edit
    end

    def create
      @bulk_rental = BulkRental.new(bulk_rental_params)
      rental_type = @bulk_rental.gear_type
      @bulk = Bulk.where(Gear_Type: rental_type).last
      if(@bulk_rental.Quantity <= @bulk.Quantity)
          @bulk.Quantity = @bulk.Quantity - @bulk_rental.Quantity
          @bulk.save
          respond_to do |format|
            if @bulk_rental.save
              #UserMailer.rental_confirmation(@user).deliver_now
              format.html { redirect_to @bulk_rental, notice: 'Bulk item rental was successfully created.' }
              format.json { render :show, status: :created, location: @bulk_rental }
            else
              format.html { render :new }
              format.json { render json: @bulk_rental.errors, status: :unprocessable_entity }
            end
          end
      else
          puts 'not enough ininventory, tried to rent ' + @bulk_rental.Quantity + ' ' + @bulk_rental.gear_type + ' but there are only ' + @bulk.Quantity + ' in stock.'
          redirect_to '/rentals'
      end
    end

    # PATCH/PUT /users/1
    # PATCH/PUT /users/1.json
    def update
      respond_to do |format|
        if @bulk_rental.update(bulk_rental_params)
          format.html { redirect_to @bulk_rental, notice: 'Bulk item rental was successfully updated.' }
          format.json { render :show, status: :ok, location: @bulk_rental }
        else
          format.html { render :edit }
          format.json { render json: @bulk_rental.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /users/1
    # DELETE /users/1.json
    def destroy
        f = File.join(Rails.root, "public/archive.csv")
        CSV.open(f, "ab") do |csv|
            csv << @bulk_rental.attributes.values
        end
        rental_type = @bulk_rental.gear_type
        @bulk = Bulk.where(Gear_Type: rental_type).last
        @bulk.Quantity = @bulk.Quantity + @bulk_rental.Quantity
        @bulk.save
        @bulk_rental.destroy
        respond_to do |format|
            format.html { redirect_to rentals_url, notice: 'Rental was successfully archived.' }
            format.json { head :no_content }
        end
    end


      # Use callbacks to share common setup or constraints between actions.
      def set_bulk_rental
        @bulk_rental = BulkRental.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def bulk_rental_params
        params.require(:bulk_rental).permit(:renter_first_name, :renter_last_name, :renter_email, :gear_type, :gear_category, :Quantity, :rental_date, :return_date, :on_time_price)
      end
  end
