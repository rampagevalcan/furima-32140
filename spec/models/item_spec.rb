require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品登録' do
    context '商品出品登録がうまくいくとき' do
      it '全ての値が正しく入力されていれば登録される' do
        expect(@item).to be_valid
      end
    end

    context '商品登録がうまくいかないとき' do
      it '商品画像がないとき' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end

      it '商品名がないとき' do
        @item.item_name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end

      it '商品の説明がないとき' do
        @item.item_description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end

      it 'カテゴリーの情報がないとき' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('カテゴリーの---は選べません。')
      end

      it '商品の状態についての情報がないとき' do
        @item.item_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の状態の---は選べません。')
      end

      it '配送料の負担についての情報がないとき' do
        @item.shopping_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('配送料の負担の---は選べません。')
      end

      it '発送元の地域についての情報がないとき' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('発送元の地域の---は選べません。')
      end

      it '発送までの日数についての情報がないとき' do
        @item.delivery_time_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('発送までの日数の---は選べません。')
      end

      it '価格についての情報がないとき' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格を入力してください")
      end

      it '価格が300円未満のとき' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は300円以上9.999.999円以内にしてください。')
      end

      it '価格が9999999円を超えるとき' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は300円以上9.999.999円以内にしてください。')
      end

      it '販売価格が半角英数で入力されてないとき' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('販売価格は数値で入力してください')
      end
    end
  end
end
