class Store::ItemsController < ApplicationController

  before_action :set_store_item, only: [:show, :edit, :update, :destroy]


  # GET /store/items
  # GET /store/items.json
  def index
    @store_items = Store::Item.all
  end

  # GET /store/items/1
  # GET /store/items/1.json
  def show
    @page=@store_item.store_pages.find_by_route(params[:page_id]||'')
  end

  # GET /store/items/new
  def new
    @store_item = Store::Item.new
  end

  # GET /store/items/1/edit
  def edit
  end

  # POST /store/items
  # POST /store/items.json
  def create
    @store_item = Store::Item.new(store_item_params)

    respond_to do |format|
      if @store_item.save
        format.html { redirect_to store_items_url+"/#{@store_item.route}", notice: 'Item was successfully created.' }
        format.json { render action: 'show', status: :created, location: @store_item }
      else
        format.html { render action: 'new' }
        format.json { render json: @store_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /store/items/1
  # PATCH/PUT /store/items/1.json
  def update
    respond_to do |format|
      if @store_item.update(store_item_params)
        format.html { redirect_to store_items_url+"/#{@store_item.route}", notice: 'Item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @store_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /store/items/1
  # DELETE /store/items/1.json
  def destroy
    @store_item.destroy
    respond_to do |format|
      format.html { redirect_to store_items_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_store_item
      @store_item = Store::Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def store_item_params
      params.require(:store_item).permit(:name, :route, :group)
    end
end
