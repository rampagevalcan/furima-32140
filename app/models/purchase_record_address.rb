class PurchaseRecordAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :telephone_number, :item_id, :user_id 

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters."}
    validates :house_number
    validates :telephone_number,format: {with: /\A\d{10}\z|\A\d{11}\z/}
end
  validates :prefecture_id, numericality: { other_than: 1,message: "can't be blank"}
end
