require 'barby'
require 'barby/barcode/code_39'
require 'barby/outputter/png_outputter'


class InventoriesController < ApplicationController
  before_action :authenticate_administrator!
  before_action :set_inventory, only: [:show, :edit, :update, :destroy]


  def index
    # @inventories = Inventory.all + Bulk.all
    @inventories = Inventory.all
  end

  # GET /inventories/1
  # GET /inventories/1.json
  def show
  end

  # GET /inventories/new
  def new
    @inventory = Inventory.new
  end

  # GET /inventories/1/edit
  def edit
  end

  # POST /inventories
  # POST /inventories.json
  def create
    @inventory = Inventory.new(inventory_params)


    theID = uniqueID
    @inventory.blahID = theID
    generate_barcodes

    theID = uniqueID
    @inventory.blahID = theID
    generate_barcodes

    @inventory.blahID = uniqueID


    theID = uniqueID
    @inventory.blahID = theID

    respond_to do |format|
      if @inventory.save
        ##create unique id and save as primary key

        format.html { redirect_to @inventory, notice: 'Inventory was successfully created.' }
        format.json { render :show, status: :created, location: @inventory }
      else
        format.html { render :new }
        format.json { render json: @inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inventories/1
  # PATCH/PUT /inventories/1.json
  def update
    respond_to do |format|
      if @inventory.update(inventory_params)
        format.html { redirect_to @inventory, notice: 'Inventory was successfully updated.' }
        format.json { render :show, status: :ok, location: @inventory }
      else
        format.html { render :edit }
        format.json { render json: @inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inventories/1
  # DELETE /inventories/1.json
  def destroy
    @inventory.destroy
    respond_to do |format|
      format.html { redirect_to inventories_url, notice: 'Inventory was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def searchAllInventories
    @inventory.searchAllInventories
    fullInventory = Bulk.all_bulk + Itemized.all_it

  end

  def uniqueID
      gt = @inventory.Gear_Type
      s = @inventory.Size
      dp = @inventory.Date_Purchased
      gc = @inventory.Gear_Category
      otherobj = Inventory.where(Gear_Type: gt, Size: s).order(Gear_Type: :asc, Size: :asc).last
      year = dp.split("/")[2].split(//).last(2).join
      if(otherobj)
          currID = otherobj.blahID.split("-")[2]
          return "#{(gt.split.map(&:chr).join.upcase)+(gc[0].upcase)}-#{s}-#{currID.to_i+1}-#{year}"
      else
          return "#{(gt.split.map(&:chr).join.upcase)+(gc[0].upcase)}-#{s}-1-#{year}"
      end
  end

  def generate_barcodes # check to see if we don't already have this barcode image uri = CGI.escape(symbology) + '_' + CGI.escape(data) + '.jpg' fname = RAILS_ROOT + '/public/Barcodes/' + uri #fname = '/var/www/html/arc_cloud/arcdevelopment/' + uri
    fnsku = @inventory.blahID
    fname = Rails.root.join("public/Barcodes/"+fnsku+".png")
    barcode = Barby::Code39.new(fnsku, true)
    File.open( fname, 'wb'){|f| f.write barcode.to_png(:height => 60, :margin => 3)}


  end
  helper_method :generate_barcodes


  private
    # Use callbacks to shar common setup or constraints between actions.
    def set_inventory
      @inventory = Inventory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inventory_params
      params.require(:inventory).permit(:Bulk, :Gear_Type, :Brand, :Model, :Color, :Size, :Serial_Number, :Retail, :Purchase_Price, :Total_Spent, :Date_Purchased, :Purchase_Method, :Reason, :Gear_Category, :Available, :blahID)
    end
end
