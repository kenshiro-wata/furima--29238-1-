class ManageOrder

  include ActiveModel::Model
  #attr_accessor :name, :email, :password, :password_confirmation, :last_name, :first_name, :last_name_kana, :first_name_kana, :birth, :image, :name, :description, :category_id, :status_id, :shipping_charges_id, :address_id, :date_takes_id, :price, :postal_code, :prefecture, :address_city, :block_number, :building_number, :phone_number, :manage
  attr_accessor :user_id, :item_id, :manage_order, :postal_code, :prefecture, :address_city, :block_number, :building_number, :phone_number, :token
  
  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture, numericality: { other_than: 0 }
    validates :address_city
    validates :block_number
    validates :phone_number, length: { maximum: 11}
    validates :token
  end

  def save
    # manage の情報を保存し、「manage」という変数に入れている
    manage = Manage.create(user_id: user_id, item_id: item_id)
    # 商品購入（住所）の情報を保存
    Order.create(postal_code: postal_code, prefecture: prefecture, address_city: address_city, block_number: block_number, building_number: building_number, phone_number: phone_number, manage_id: manage.id)
  end

end