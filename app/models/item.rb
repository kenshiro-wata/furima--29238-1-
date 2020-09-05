class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :address
  belongs_to_active_hash :status
  belongs_to_active_hash :category
  belongs_to_active_hash :charge
  belongs_to_active_hash :day


  belongs_to :user

  validates :address_id, numericality: { other_than: 0 }
  validates :status_id, numericality: { other_than: 0 }
  validates :category_id, numericality: { other_than: 0 }
  validates :charge_id, numericality: { other_than: 0 }
  validates :date_takes_id, numericality: { other_than: 0 }
end
