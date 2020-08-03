require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end 
  
  describe '商品を出品' do
    context '出品できる', item_can_save: true do
      it 'すべて正しい入力' do
        item = build(:item)
        item.valid?
        expect(item).to be_valid
      end
    end

    context '出品できない', item_cant_save: true do
      it 'imageが空だと出品できない' do
        item = build(:item, image: nil)
        item.valid?
        expect(item.errors[:image]).to include('can\'t be blank')
      end
      it 'nameが空だと出品できない' do
        item = build(:item, name: nil)
        item.valid?
        expect(item.errors[:name]).to include('can\'t be blank')
      end
      it 'introductionがないと出品できない' do
        item = build(:item, introduction: nil)
        item.valid?
        expect(item.errors[:introduction]).to include('can\'t be blank')
      end
      it 'categoryが空だと出品できない' do
        item = build(:item, category_id: nil)
        item.valid?
        expect(item.errors[:category_id]).to include('を選択してください')
      end
      it 'conditionが空だと出品できない' do
        item = build(:item, condition: nil)
        item.valid?
        expect(item.errors[:condition]).to include('can\'t be blank')
      end
      it 'dekivery_feeが空だと出品できない' do
        item = build(:item, delivery_fee: nil)
        item.valid?
        expect(item.errors[:delivery_fee]).to include('can\'t be blank')
      end
      it 'delivery_daysが空だと出品できない' do
        item = build(:item, delivery_days: nil)
        item.valid?
        expect(item.errors[:delivery_days]).to include('can\'t be blank')
      end
      it 'prefectureが空だと出品できない' do
        item = build(:item, prefecture_id: nil)
        item.valid?
        expect(item.errors[:prefecture_id]).to include('を選択してください')
      end
      it 'priceが300~9999999の間で設定されていなければならない' do
        item = build(:item, price: nil)
        item.valid?
        expect(item.errors[:price]).to include('can\'t be blank')
      end
      it 'priceが300未満では登録できないこと' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
  
      it 'priceが9,999,999より大きいと登録できないこと' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
    end
  end
end