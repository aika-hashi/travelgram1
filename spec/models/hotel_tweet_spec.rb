require 'rails_helper'
describe HotelTweet do
  before do
    @hoteltweet = FactoryBot.build(:item)
    @hoteltweet.image = fixture_file_upload('public/images/test_image.png')
  end
  

  describe '商品出品' do
    context '商品出品がうまくいくとき' do
      it "image、title、text、priceが存在すれば登録できる" do
        expect(@item).to be_valid
      end
      it "category、condition、charge、area、dayがid:1以外であれば登録できる" do
        @item.category_id = 2
        @item.condition_id = 2
        @item.charge_id =  2
        @item.area_id = 2
        @item.day_id = 2
        expect(@item).to be_valid
     end
      it "priceが¥300~¥9,999,999の間であると登録できる" do
        @item.price = 2000
        expect(@item).to be_valid
      end
      it "priceが半角数字のみの入力で登録できる" do
        @item.price = 2000
        expect(@item).to be_valid
      end
      
    end

    context '商品出品がうまくいかないとき' do
      it "imageが空だと登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "titleが空では登録できない" do
        @item.title = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it "textが空では登録できない" do
        @item.text = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it "categoryがid:1では登録できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it "conditionがid:1では登録できない" do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end
      it "chargeがid:1では登録できない" do
        @item.charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Charge must be other than 1")
      end
      it "areaがid:1では登録できない" do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Area must be other than 1")
      end
      it "dayがid:1では登録できない" do
        @item.day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Day must be other than 1")
      end
      it "priceが空では登録できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")

      end
      it "priceが¥300未満であると登録できない" do
        @item.price = "200"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "priceが10,000,000以上であると登録できない" do
        @item.price = "12345678"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 10000000")
      end
      it "priceが半角数字以外の入力では登録できない" do
        @item.price = "１２３４５"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number", "Price is invalid. Input full-width characters.")
      end
    
    end
  end
end

