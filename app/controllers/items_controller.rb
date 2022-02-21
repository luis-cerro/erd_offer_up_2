class ItemsController < ApplicationController
  before_action :current_user_must_be_item_owner, only: [:edit, :update, :destroy] 

  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  def index
    @q = Item.ransack(params[:q])
    @items = @q.result(:distinct => true).includes(:item_category, :owner, :item_status).page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@items.where.not(:item_location_latitude => nil)) do |item, marker|
      marker.lat item.item_location_latitude
      marker.lng item.item_location_longitude
      marker.infowindow "<h5><a href='/items/#{item.id}'>#{item.item_description}</a></h5><small>#{item.item_location_formatted_address}</small>"
    end
  end

  # GET /items/1
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  def create
    @item = Item.new(item_params)

    if @item.save
      message = 'Item was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @item, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /items/1
  def update
    if @item.update(item_params)
      redirect_to @item, notice: 'Item was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /items/1
  def destroy
    @item.destroy
    message = "Item was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to items_url, notice: message
    end
  end


  private

  def current_user_must_be_item_owner
    set_item
    unless current_user == @item.owner
      redirect_back fallback_location: root_path, alert: "You are not authorized for that."
    end
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def item_params
      params.require(:item).permit(:item_description, :item_status_id, :item_title, :item_category_id, :item_location, :owner_id, :price)
    end
end
