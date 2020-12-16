require 'rails_helper'

RSpec.describe PurchaseRecordAddress, type: :model do
    before do
      @purchase_record_address = FactoryBot.build(:purchase_record_address)
    end

 describe '商品購入' do
  context '商品購入がうまくいくとき' do
    it '全ての値が正しく入力されていれば購入できる' do
      expect(@purchase_record_address).to be_valid
    end
  end

  context '商品購入がうまくいかないとき' do
    it '郵便番号がないとき' do
      @purchase_record_address.postal_code = nil
      @purchase_record_address.valid?
      expect(@purchase_record_address.errors.full_messages).to include("Postal code can't be blank")
    end

    it '郵便番号に半角のハイフンがないとき' do
      @purchase_record_address.postal_code = '1234567'
      @purchase_record_address.valid?
      expect(@purchase_record_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end

    it '配送先の都道府県の情報がないとき'do
      @purchase_record_address.prefecture_id = 1
      @purchase_record_address.valid?
      expect(@purchase_record_address.errors.full_messages).to include("Prefecture can't be blank")
    end

    it '配送先の市町村の情報がないとき'do
      @purchase_record_address.city = nil
      @purchase_record_address.valid?
      expect(@purchase_record_address.errors.full_messages).to include("City can't be blank")
    end

    it '配送先の番地がないとき' do
      @purchase_record_address.house_number = nil
      @purchase_record_address.valid?
      expect(@purchase_record_address.errors.full_messages).to include("House number can't be blank")
    end

    it '電話番号の情報がないとき' do
      @purchase_record_address.telephone_number = nil
      @purchase_record_address.valid?
      expect(@purchase_record_address.errors.full_messages).to include("Telephone number can't be blank")
    end

    it '電話番号が11桁以上のとき' do
      @purchase_record_address.telephone_number = '000000000000'
      @purchase_record_address.valid?
      expect(@purchase_record_address.errors.full_messages).to include("Telephone number is invalid")
    end
  end
 end
end
