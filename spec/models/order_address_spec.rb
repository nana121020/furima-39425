require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end
      it 'build_nameは空でも保存できること' do
        @order_address.build_name = ''
        expect(@order_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'tokenが空だと購入できないこと' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'post_numberが空だと保存できないこと' do
        @order_address.post_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post number can't be blank")
      end
      it 'post_numberが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_address.post_number = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Post number is invalid. Include hyphen(-)')
      end
      it 'prefecture_idを選択していないと保存できないこと' do
        @order_address.prefecture_id = 0
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'city_nameが空だと保存できないこと' do
        @order_address.city_name = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City name can't be blank")
      end
      it 'banchiが空だと保存できないこと' do
        @order_address.banchi = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Banchi can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_number9桁以下では保存できない' do
        @order_address.phone_number = '123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid. Should be 10 to 11 digits")
      end
      it 'phone_number12桁以上では保存できない' do
        @order_address.phone_number = '123456789012'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid. Should be 10 to 11 digits")
      end
      it 'phone_number数字以外が含まれると保存できない' do
        @order_address.phone_number = '123abc456'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid. Should be 10 to 11 digits")
      end
      it 'item_idが空だと保存できないこと' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'userが紐付いていないと保存できないこと' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end
