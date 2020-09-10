class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :set_item, only: [:show, :edit]

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def index
    @items = Item.all.order('created_at DESC')
  end

  def show
  end

  def edit
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :status_id, :shipping_charges_id, :address_id, :date_takes_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
