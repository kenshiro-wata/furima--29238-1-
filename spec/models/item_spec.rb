require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.build(:item)
      @item.user_id = @user.id
      @item.image = fixture_file_upload('public/images/test_image.png')
    end

    it 'name, description, category, status, shipping_charges, address, date_takes, price, imageが存在すれば登録できること' do
      expect(@item).to be_valid
    end

    it 'nameが空では登録できないこと' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it 'descriptionが空では登録できないこと' do
      @item.description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it 'category_idが空では登録できないこと' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it 'status_idが空では登録できないこと' do
      @item.status_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end

    it 'shipping_charges_idが空では登録できないこと' do
      @item.shipping_charges_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping charges can't be blank")
    end

    it 'address_idが空では登録できないこと' do
      @item.address_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Address can't be blank")
    end

    it 'date_takes_idが空では登録できないこと' do
      @item.date_takes_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Date takes can't be blank")
    end

    it 'priceが空では登録できないこと' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it 'iamgeが空では登録できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it 'prieceは半角数字で入力しないと登録できないこと' do
      @item.price = '４０００'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not included in the list')
    end

    it 'prieceは¥300以下で入力すると登録できないこと' do
      @item.price = '50'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not included in the list')
    end

    it 'priceは¥10000000以上で入力すると登録できないこと' do
      @item.price = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not included in the list')
    end

    it 'category_idが0だと登録できないこと' do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 0")
    end

    it 'status_idが0だと登録できないこと' do
      @item.status_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Status must be other than 0")
    end

    it 'shipping_charges_idが0だと登録できないこと' do
      @item.shipping_charges_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping charges must be other than 0")
    end

    it 'address_idが0だと登録できないこと' do
      @item.address_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Address must be other than 0")
    end

    it 'date_takes_idが0だと登録できないこと' do
      @item.date_takes_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Date takes must be other than 0")
    end

  end
end
