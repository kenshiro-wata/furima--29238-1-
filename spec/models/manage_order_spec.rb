require 'rails_helper'

RSpec.describe ManageOrder, type: :model do
  describe '商品出品' do
    before do
      @manage_order = FactoryBot.build(:manage_order)
    end

    it 'postal_code, prefecture, address_city, block_number, phone_number, tokenが存在すれば登録できること' do
      expect(@manage_order).to be_valid
    end

    it 'prefectureが空では登録できないこと' do
      @manage_order.prefecture = nil
      @manage_order.valid?
      expect(@manage_order.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'postal_codeが空では登録できないこと' do
      @manage_order.postal_code = nil
      @manage_order.valid?
      expect(@manage_order.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'address_cityが空では登録できないこと' do
      @manage_order.address_city = nil
      @manage_order.valid?
      expect(@manage_order.errors.full_messages).to include("Address city can't be blank")
    end
    it 'block_numberが空では登録できないこと' do
      @manage_order.block_number = nil
      @manage_order.valid?
      expect(@manage_order.errors.full_messages).to include("Block number can't be blank")
    end
    it 'phone_numberが空では登録できないこと' do
      @manage_order.phone_number = nil
      @manage_order.valid?
      expect(@manage_order.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'tokenが空では登録できないこと' do
      @manage_order.token = nil
      @manage_order.valid?
      expect(@manage_order.errors.full_messages).to include("Token can't be blank")
    end

    it '郵便番号にはハイフンがないと登録できないこと' do
      @manage_order.postal_code = '1111111'
      @manage_order.valid?
      expect(@manage_order.errors.full_messages).to include("Postal code is invalid")
    end

    it '電話番号は１１桁以内でないと登録できないこと' do
      @manage_order.phone_number = '080123412345'
      @manage_order.valid?
      expect(@manage_order.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
    end

    it '都道府県番号は０だと登録できないこと' do
      @manage_order.prefecture = 0
      @manage_order.valid?
      expect(@manage_order.errors.full_messages).to include("Prefecture must be other than 0")
    end

  end
end

