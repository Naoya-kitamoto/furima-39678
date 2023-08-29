require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe "商品の購入" do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
    end


    context "商品を購入できるとき" do
      it "municipalities,street_address,phona_number,post_code,sender_id,が存在すると出品できる" do
        expect(@purchase_address).to be_valid
      end
    end
    context "商品を購入できない時" do
      it "municioalitiesが空だと購入できない" do
        @purchase_address.municipalities = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Municipalities can't be blank")
      end
      it "street_addressが空だと購入できない" do
        @purchase_address.street_address = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Street address can't be blank")
      end
      it "phona_numberが空だと購入できない" do
        @purchase_address.phone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid. Must be 10 to 11 digits")
      end
      it "post_codeが空だと購入できない" do
        @purchase_address.post_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post code can't be blank", "Post code is invalid. Include hyphen(-)")
      end
      it "sender_idが空だと購入できない" do
        @purchase_address.sender_id = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Sender can't be blank")
      end
      it "post_codeがハイフンを含まない場合購入できない" do
        @purchase_address.post_code = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it "post_codeが3-4の7桁の数字ではない場合購入できない" do
        @purchase_address.post_code = '1234-5678'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it "sender_idが1の場合購入できない" do
        @purchase_address.sender_id = '1'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Sender can't be blank")
      end
      it "phone_numberが10桁未満の場合購入できない" do
        @purchase_address.phone_number = '123456789'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid. Must be 10 to 11 digits")
      end
      it "phone_numberが12桁以上の場合購入できない" do
        @purchase_address.phone_number = '123456789012'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid. Must be 10 to 11 digits")
      end
      it "tokenが空では購入できない" do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end