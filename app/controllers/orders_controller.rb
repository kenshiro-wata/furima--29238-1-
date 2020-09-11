class OrdersController < ApplicationController
  #before_action :move_to_index

  def index
    #@item = Item.find(params[:id]) 
  end

  def new
    @order = ManageOrder.new
  end
  
  def create
    @order = Order.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:manage).permit(:user_id, :item_id, :postal_code, :prefecture, :address_city, :block_number, :building_number, :phone_number, :manage, :token)
  end

  def pay_item
    Payjp.api_key = "sk_test_c1535ae317764ee71edeafae"  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: order_params[:price],  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

  #def move_to_index
    #redirect_to controller: 'items', action: 'index' unless user_signed_in? 
  #end

end
