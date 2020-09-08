class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :address
  belongs_to_active_hash :status
  belongs_to_active_hash :category
  belongs_to_active_hash :charge
  belongs_to_active_hash :day

  belongs_to :user
  has_one_attached :image

  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true, numericality: { other_than: 0 }
  validates :status_id, presence: true, numericality: { other_than: 0 }
  validates :shipping_charges_id, presence: true, numericality: { other_than: 0 }
  validates :address_id, presence: true, numericality: { other_than: 0 }
  validates :date_takes_id, presence: true, numericality: { other_than: 0 }
  validates :price, presence: true, inclusion: { in: 300..9_999_999 }
  validates :image, presence: true
end
