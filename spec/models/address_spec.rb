require 'rails_helper'

RSpec.describe Address, type: :model do
  before do
    @address = FactoryBot.build(:address)
  end

  describe "住所情報の保存" do
    context "住所情報を保存できるとき" do
      it "municipalities,street_address,phona_number,post_code,sender_idが存在すると出品できる" do
        expect(@address).to be_valid
      end
    end
    context "商品を出品できない時" do
      it "municioalitiesが空だと保存できない" do
        @address.municipalities = ''
        @address.valid?
        expect(@item.errors.full_messages).to include("Municipalities can't be blank")
      end
      it "street_addressが空だと保存できない" do
        @address.street_address = ''
        @address.valid?
        expect(@item.errors.full_messages).to include("Street Address can't be blank")
      end
      it "phona_numberが空だと保存できない" do
        @address.phone_number = ''
        @address.valid?
        expect(@item.errors.full_messages).to include("Phone Number can't be blank")
      end
      it "post_codeが空だと保存できない" do
        @address.post_code = ''
        @address.valid?
        expect(@item.errors.full_messages).to include("Post Code can't be blank")
      end
      it "sender_idが空だと保存できない" do
        @address.sender_id = ''
        @address.valid?
        expect(@item.errors.full_messages).to include("Sender can't be blank")
      end
      it "post_codeがハイフンを含まない場合保存できない" do
        @address.municipalities = '1234567'
        @address.valid?
        expect(@item.errors.full_messages).to include("Post Code is invalid. Include hyphen(-)")
      end
      it "post_codeが3-4の7桁の数字ではない場合保存できない" do
        @address.post_code = '1234-5678'
        @address.valid?
        expect(@item.errors.full_messages).to include("Post Cpde is invalid. Include hyphen(-)")
      end
      it "sender_idが1の場合保存できない" do
        @address.municipalities = '1'
        @address.valid?
        expect(@item.errors.full_messages).to include("Sender Id can't be blank")
      end
      it "phone_numberが10桁未満の場合保存できない" do
        @address.municipalities = '123456789'
        @address.valid?
        expect(@item.errors.full_messages).to include("Phone Number is invalid. Must be 10 to 11 digits")
      end
      it "phone_numberが12桁以上の場合保存できない" do
        @address.phone_number = '123456789012'
        @address.valid?
        expect(@item.errors.full_messages).to include("Phone Number is invalid. Must be 10 to 11 digits")
      end
    end
  end
end