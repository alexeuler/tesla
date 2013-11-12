class Store::PagesController < ApplicationController
  before_action :set_store_page, only: [:show, :edit, :update, :destroy]

  # GET /store/pages
  # GET /store/pages.json
  def index
    @store_pages = Store::Page.all
  end

  # GET /store/pages/1
  # GET /store/pages/1.json
  def show
  end

  # GET /store/pages/new
  def new
    @store_page = Store::Page.new(store_item_id: params[:id])
    
  end

  # GET /store/pages/1/edit
  def edit
  end

  # POST /store/pages
  # POST /store/pages.json
  def create
    @store_page = Store::Page.new(store_page_params)

    respond_to do |format|
      if @store_page.save
        format.html { redirect_to @store_page, notice: 'Page was successfully created.' }
        format.json { render action: 'show', status: :created, location: @store_page }
      else
        format.html { render action: 'new' }
        format.json { render json: @store_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /store/pages/1
  # PATCH/PUT /store/pages/1.json
  def update
    respond_to do |format|
      if @store_page.update(store_page_params)
        format.html { redirect_to @store_page, notice: 'Page was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @store_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /store/pages/1
  # DELETE /store/pages/1.json
  def destroy
    @store_page.destroy
    respond_to do |format|
      format.html { redirect_to store_pages_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_store_page
      @store_page = Store::Page.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def store_page_params
      params.require(:store_page).permit(:name, :route, :html, :store_item_id)
    end
end
