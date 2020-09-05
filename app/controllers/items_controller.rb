class ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private 
  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :status_id, :shipping_charges_id, :address_id, :date_takes_id, :price)#.merge(user_id: current_user.id)
  end

end
