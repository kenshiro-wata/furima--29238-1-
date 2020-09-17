class Order < ApplicationRecord
  belongs_to :manage

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture
    validates :address_city
    validates :block_number
    validates :phone_number, length: { maximum: 11 }
  end
end
