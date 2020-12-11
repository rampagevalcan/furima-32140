class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :item_condition
  belongs_to_active_hash :shopping_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :delivery_time
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :item_name
    validates :item_description
  with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :item_condition_id
      validates :shopping_fee_id
      validates :prefecture_id
      validates :delivery_time_id
    end
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :price, numericality: { only_integer: true }
  end
end
