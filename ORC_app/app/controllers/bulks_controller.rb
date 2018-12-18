class BulksController < ApplicationController
    before_action :authenticate_administrator!
    before_action :set_bulk, only: [:show, :edit, :update, :destroy]

    # GET /users/1
    # GET /users/1.json
    def show
    end

    # GET /users/new
    def new
       @bulk = Bulk.new

    end

    # GET /users/1/edit
    def edit
    end

    def create
      @bulk = Bulk.new(bulk_params)


      respond_to do |format|
        if @bulk.save
          #UserMailer.rental_confirmation(@user).deliver_now
          format.html { redirect_to @bulk, notice: 'Bulk item was successfully created.' }
          format.json { render :show, status: :created, location: @user }
        else
          format.html { render :new }
          format.json { render json: @bulk.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /users/1
    # PATCH/PUT /users/1.json
    def update
      respond_to do |format|
        if @bulk.update(bulk_params)
          format.html { redirect_to @bulk, notice: 'Bulk item was successfully updated.' }
          format.json { render :show, status: :ok, location: @bulk }
        else
          format.html { render :edit }
          format.json { render json: @bulk.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /users/1
    # DELETE /users/1.json
    def destroy
      @bulk.destroy
      respond_to do |format|
        format.html { redirect_to inventories_path, notice: 'Bulk item was successfully destroyed.' }
        format.json { head :no_content }
      end
    end


      # Use callbacks to share common setup or constraints between actions.
      def set_bulk
        @bulk = Bulk.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def bulk_params
        params.require(:bulk).permit(:Gear_Type, :Gear_Category,:Quantity, :Notes)
      end
  end
