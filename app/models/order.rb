class Order < ApplicationRecord

  belongs_to :manage
  
  validates :price, presence: true
end
