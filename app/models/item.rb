class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :item_condition
  belongs_to_active_hash :shopping_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :delivery_time
  belongs_to :user
  has_one_attached :image
end
