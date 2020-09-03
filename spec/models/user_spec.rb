require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "name、email、password、password_confirmation、last_name, first_name, last_name_kana, first_name_kana, birthが存在すれば登録できること" do
      expect(@user).to be_valid
    end

    it "nameが空では登録できないこと" do
      @user.name = nil 
      @user.valid?
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end

    it "emailが空では登録できないこと" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "passwordが空では登録できないこと" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
      @user.password_confirmation = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end

    it "last_nameが空では登録できないこと" do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it "first_nameが空では登録できないこと" do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "last_name_kanaが空では登録できないこと" do
      @user.last_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it "first_nameが空では登録できないこと" do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it "birthが空では登録できないこと" do
      @user.birth = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth can't be blank")
    end

    it "重複したemailが存在する場合登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    #it "passwordが6文字以上であれば登録できること" do
      #@user.password = "123456"
      #@user.password_confirmation = "123456"
      #expect(@user).to be_valid
    #end

    it "passwordが5文字以下であれば登録できないこと" do
      @user.password = "12345"
      @user.password_confirmation = "12345"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "パスワードは半角英数字混合しないと登録できないこと" do
      @user.password = "testpass"
      @user.password_confirmation = "testpass"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid") #エラー文をPassword Include both letters and numbersにしたいができない
    end
    
    it "ユーザー本名は全角（漢字・ひらがな・カタカナ）で入力しないと登録できないこと" do
      @user.last_name = "furima"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end

    it "ユーザー本名は全角（漢字・ひらがな・カタカナ）で入力しないと登録できないこと" do
      @user.first_name = "man"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end

    it "ユーザー本名のフリガナは全角（カタカナ）で入力しないと登録できないこと" do
      @user.last_name_kana = "山田"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
    end

    it "ユーザー本名のフリガナは全角（カタカナ）で入力しないと登録できないこと" do
      @user.first_name_kana = "ふりま"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end


  end
end