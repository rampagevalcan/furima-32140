require 'rails_helper'

RSpec.describe PurchaseRecordAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @purchase_record_address = FactoryBot.build(:purchase_record_address,user_id:@user.id,item_id:@item.id)
  sleep(1)
  end

  describe '商品購入' do
    context '商品購入がうまくいくとき' do
      it '全ての値が正しく入力されていれば購入できる' do
        expect(@purchase_record_address).to be_valid
      end

      it '建物名が空の場合でも購入できる' do
        @purchase_record_address.building_name = nil
        expect(@purchase_record_address).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it '郵便番号がないとき' do
        @purchase_record_address.postal_code = nil
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("郵便番号を入力してください")
      end

      it '郵便番号に半角のハイフンがないとき' do
        @purchase_record_address.postal_code = '1234567'
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include('郵便番号に(-)が含まれていません。')
      end

      it '配送先の都道府県の情報がないとき' do
        @purchase_record_address.prefecture_id = 1
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("都道府県は空欄にできません。")
      end

      it '配送先の市町村の情報がないとき' do
        @purchase_record_address.city = nil
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("市町村を入力してください")
      end

      it '配送先の番地がないとき' do
        @purchase_record_address.house_number = nil
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("番地を入力してください")
      end

      it '電話番号の情報がないとき' do
        @purchase_record_address.telephone_number = nil
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("電話番号を入力してください")
      end

      it '電話番号が11桁以上のとき' do
        @purchase_record_address.telephone_number = '000000000000'
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include('電話番号は不正な値です')
      end

      it 'tokenが空のとき' do
        @purchase_record_address.token = nil
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("カード情報、有効期限、セキュリティコードを入力してください")
      end

      it 'user_idが空のとき' do
        @purchase_record_address.user_id = nil
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Userを入力してください")
      end

      it 'item_idが空のとき' do
        @purchase_record_address.item_id= nil
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("Itemを入力してください")
      end

      it '電話番号が英字混合のとき' do
        @purchase_record_address.telephone_number = '000abcdefgh'
        @purchase_record_address.valid?
        expect(@purchase_record_address.errors.full_messages).to include("電話番号は不正な値です")
      end
    end
  end
end
