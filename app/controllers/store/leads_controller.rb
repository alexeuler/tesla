class Store::LeadsController < ApplicationController
  before_action :set_store_lead, only: [:show, :edit, :update, :destroy]
  before_action :require_admin

  # GET /store/leads
  # GET /store/leads.json
  def index
    @store_leads = Store::Lead.all
  end

  # GET /store/leads/1
  # GET /store/leads/1.json
  def show
  end

  # GET /store/leads/new
  def new
    @store_lead = Store::Lead.new
  end

  # GET /store/leads/1/edit
  def edit
  end

  # POST /store/leads
  # POST /store/leads.json
  def create
    @store_lead = Store::Lead.new(store_lead_params)

    respond_to do |format|
      if @store_lead.save
        format.html { redirect_to @store_lead, notice: 'Lead was successfully created.' }
        format.json { render action: 'show', status: :created, location: @store_lead }
      else
        format.html { render action: 'new' }
        format.json { render json: @store_lead.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /store/leads/1
  # PATCH/PUT /store/leads/1.json
  def update
    respond_to do |format|
      if @store_lead.update(store_lead_params)
        format.html { redirect_to @store_lead, notice: 'Lead was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @store_lead.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /store/leads/1
  # DELETE /store/leads/1.json
  def destroy
    @store_lead.destroy
    respond_to do |format|
      format.html { redirect_to store_leads_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_store_lead
      @store_lead = Store::Lead.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def store_lead_params
      params.require(:store_lead).permit(:name, :phone, :email, :address, :comments, :quantity, :color, :size, :aux, :item_id)
    end
end
