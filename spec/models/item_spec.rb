require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end


  describe "商品出品機能" do
    context "商品を出品できるとき" do
      it "item_name,explanation,category_id,condition_id,sender_id,delivery_charge_id,delivery_day_id,price,imageが存在すると出品できる" do
        expect(@item).to be_valid
      end
    end
    context "商品を出品できない時" do
      it "item_nameが空だと出品できない" do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it "explanationが空だと出品できない" do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it "category_idが空では出品できない" do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "condition_idが空では出品できない" do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it "sender_idが空だと出品できない" do
        @item.sender_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Sender can't be blank")
      end
      it "delivery_charge_idが空では出品できない" do
        @item.delivery_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge can't be blank","Delivery charge can't be blank")
      end
      it "delivery_day_idが空だと出品できない" do
        @item.delivery_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day can't be blank", "Delivery day can't be blank")
      end
      it "priceが空では出品できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "imageが空だと出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "category_idが1だと出品できない" do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "condition_idが1だと出品できない" do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it "sender_idが1だと出品できない" do
        @item.sender_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Sender can't be blank")
      end
      it "delivery_charge_idが1だと出品できない" do
        @item.delivery_charge_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
      end
      it "delivery_day_idが1だと出品できない" do
        @item.delivery_day_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day can't be blank")
      end
      it "priceが299円以下の場合出品できない" do
        @item.price = '200'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is enter between 299 and 1000000")
      end
      it 'priceが10000000円以上の場合出品できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is enter between 299 and 1000000")
      end
      it "priceに半角数字以外が入力された場合出品できない" do
        @item.price = "こんにちは"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is enter between 299 and 1000000")
      end
    end
  end
end
