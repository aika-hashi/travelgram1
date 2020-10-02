require 'rails_helper'
describe HotelTweet do
  before do
    @hoteltweet = FactoryBot.build(:hotel_tweet)
    @hoteltweet.images = fixture_file_upload('app/assets/images/test_image.png')
  end
  

  describe '投稿' do
    context '投稿がうまくいくとき' do
      it "images、title、text、price、localが存在すれば登録できる" do
        expect(@hoteltweet).to be_valid
      end
      it "area、がid:1以外であれば登録できる" do
        @hoteltweet.area_id = 2
        expect(@hoteltweet).to be_valid
     end
      
    end

    context '投稿がうまくいかないとき' do
      it "imagesが空だと登録できない" do
        @hoteltweet.images = nil
        @hoteltweet.valid?
        expect(@hoteltweet.errors.full_messages).to include("Imagesを入力してください")
      end
      it "titleが空では登録できない" do
        @hoteltweet.title = nil
        @hoteltweet.valid?
        expect(@hoteltweet.errors.full_messages).to include("Titleを入力してください")
      end
      it "textが空では登録できない" do
        @hoteltweet.text = nil
        @hoteltweet.valid?
        expect(@hoteltweet.errors.full_messages).to include("Textを入力してください")
      end
      it "areaがid:1では登録できない" do
        @hoteltweet.area_id = 1
        @hoteltweet.valid?
        expect(@hoteltweet.errors.full_messages).to include("Areaは1以外の値にしてください")
      end
      it "localが空では登録できない" do
        @hoteltweet.local = nil
        @hoteltweet.valid?
        expect(@hoteltweet.errors.full_messages).to include("Localを入力してください")
      end
      it "priceが空では登録できない" do
        @hoteltweet.price = nil
        @hoteltweet.valid?
        expect(@hoteltweet.errors.full_messages).to include("Priceを入力してください")
      end
    
    end
  end
end

