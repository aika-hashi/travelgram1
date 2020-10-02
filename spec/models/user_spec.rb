require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end


describe 'ユーザー新規登録' do
  context '新規登録がうまくいくとき' do
    it "nicknameとemail、passwordとpassword_confirmation、firstname、familyname、firstname_kana、familyname_kana、dateが存在すれば登録できる" do
      expect(@user).to be_valid
    end
    it "emailに＠を含まれていれば登録できる" do
      @user.email = "a@a"
      expect(@user).to be_valid
    end
    it "passwordが6文字以上であれば登録できる" do
      @user.password = "000000"
      @user.password_confirmation = "000000"
      expect(@user).to be_valid
    end
    it "passwordは半角英数字混合であると登録できる" do
      @user.password = "abc123"
      @user.password_confirmation = "abc123"
      expect(@user).to be_valid
    end
  end

  context '新規登録がうまくいかないとき' do
    it "nicknameが空だと登録できない" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("ニックネームを入力してください")
    end
    it "emailが空では登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールを入力してください")
    end
    it "重複したemailが存在する場合登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
    end
    it "emailに＠を含まなければ登録できない" do
      @user.email = "aaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールは不正な値です")
    end
    it "passwordが空では登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください")
    end
    it "passwordが5文字以下であれば登録できない" do
      @user.password = "00000"
      @user.password_confirmation = "00000"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
    end
    it "passwordは半角英字片方だけでは登録できない" do
      @user.password = "abcdef"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end
    it "passwordは半角数字片方だけでは登録できない" do
      @user.password = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end
    it "passwordが存在してもpassword_confirmationが空では登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）を入力してください")
    end
    it "firstname_kanaが全角カタカナ以外だと登録できない
    登録できない" do
      @user.firstname_kana = "陸たろう"
      @user.valid?
      expect(@user.errors.full_messages).to include("名前のカナis invalid. Input full-width characters.")
    end
    it "familyname_kanaが全角カタカナ以外だと登録できない" do
      @user.familyname_kana = "山だ"
      @user.valid?
      expect(@user.errors.full_messages).to include("苗字のカナis invalid. Input full-width characters.")
    end
  end
end






describe 'ログイン' do
  context 'ログインがうまくいくとき' do
    it "emailとpasswordが存在すればログインできる" do
      expect(@user).to be_valid
    end
  end
   
  context 'ログインがうまくいかないとき' do
    it "emailが空ではログインできない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
    it "passwordが空ではログインできない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
   end
  end
end