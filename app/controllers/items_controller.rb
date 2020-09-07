class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index]

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
    redirect_to root_path
  end

  def index
    @items = Item.all #.includes(:active_storage_attachments, :active_storage_blobs)
  end

  #def price 
    #price = Item.find(params[:price])
    #@fee = price * 0.1
    #@profit = price - @fee
    #render json: { item: price }
  #end

  private 
  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :status_id, :shipping_charges_id, :address_id, :date_takes_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
  
end
