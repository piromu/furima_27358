require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
  
  before do
    @buyer = FactoryBot.build(:buyer)
    @seller = FactoryBot.build(:seller)
  end

  describe '注文新規登録' do
    context '注文新規登録がうまくいくとき' do
      it "関連モデルのレコードがあれば新規登録できる" do

        expect(@buyer).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "userが存在しないと登録できない" do
        @item_order.user = nil
        @item_order.valid?
        expect(@buyer.errors.full_messages).to include("User must exist")
      end
      it "itemが存在しないと登録できない" do
        @item_order.item = nil
        @item_order.valid?
        expect(@seller.errors.full_messages).to include("Item must exist")
      end
    end
  end
end
