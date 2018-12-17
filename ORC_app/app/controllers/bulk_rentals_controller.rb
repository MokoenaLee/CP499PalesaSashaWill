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
      @bulk_rental.destroy
      respond_to do |format|
        format.html { redirect_to inventories_path, notice: 'Bulk item rental was successfully destroyed.' }
        format.json { head :no_content }
      end
    end


      # Use callbacks to share common setup or constraints between actions.
      def set_bulk_rental
        @bulk_rental = BulkRental.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def bulk_rental_params
        params.require(:bulk_rental).permit(:Gear_Type, :Gear_Category,:Quantity, :Notes)
      end
  end
