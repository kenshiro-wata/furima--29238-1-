class OrdersController < ApplicationController
  #before_action :move_to_index

  def new
    @order = ManageOrder.new
    @item = Item.find(params[:item_id])
  end
  
  def create
    @order = ManageOrder.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:manage_order).permit(:manage_order, :postal_code, :prefecture, :address_city, :block_number, :building_number, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

  #def move_to_index
    #redirect_to controller: 'items', action: 'index' unless user_signed_in? 
  #end

end
