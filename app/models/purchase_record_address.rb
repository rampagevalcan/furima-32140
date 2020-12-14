class PurchaseRecordAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :telephone_number, :item_id, :user_id 
end