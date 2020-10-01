require 'rails_helper'
describe HotelTweet do
  before do
    @hoteltweet = FactoryBot.build(:hotel_tweet)
    @hoteltweet.image = fixture_file_upload('app/assets/images/test_image.png')
  end
  

  describe '投稿' do
    context '投稿がうまくいくとき' do
      it "image、title、text、price、localが存在すれば登録できる" do
        expect(@hoteltweet).to be_valid
      end
      it "area、がid:1以外であれば登録できる" do
        @hoteltweet.area_id = 2
        expect(@hoteltweet).to be_valid
     end
      
    end

    context '投稿がうまくいかないとき' do
      it "imageが空だと登録できない" do
        @hoteltweet.image = nil
        @hoteltweet.valid?
        expect(@hoteltweet.errors.full_messages).to include("Image can't be blank")
      end
      it "titleが空では登録できない" do
        @hoteltweet.title = nil
        @hoteltweet.valid?
        expect(@hoteltweet.errors.full_messages).to include("Title can't be blank")
      end
      it "textが空では登録できない" do
        @hoteltweet.text = nil
        @hoteltweet.valid?
        expect(@hoteltweet.errors.full_messages).to include("Text can't be blank")
      end
      it "areaがid:1では登録できない" do
        @hoteltweet.area_id = 1
        @hoteltweet.valid?
        expect(@hoteltweet.errors.full_messages).to include("Area must be other than 1")
      end
      it "localが空では登録できない" do
        @hoteltweet.local = nil
        @hoteltweet.valid?
        expect(@hoteltweet.errors.full_messages).to include("Local can't be blank")
      end
      it "priceが空では登録できない" do
        @hoteltweet.price = nil
        @hoteltweet.valid?
        expect(@hoteltweet.errors.full_messages).to include("Price can't be blank")
      end
    
    end
  end
end

