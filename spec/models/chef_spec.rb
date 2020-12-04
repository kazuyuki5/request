require 'rails_helper'

RSpec.describe Chef, type: :model do
  before do
    @chef = FactoryBot.build(:chef)
  end

  describe 'シェフ情報の保存' do
    context 'シェフの情報が保存できる場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@chef).to be_valid
      end
    end
    context 'シェフの情報が保存できない場合' do
      it 'nicknameが空だと保存できないこと' do
        @chef.nickname = ''
        @chef.valid?
        expect(@chef.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'imageが空だと保存できないこと' do
        @chef.image = nil
        @chef.valid?
        expect(@chef.errors.full_messages).to include
      end
      it 'profileが空だと保存できないこと' do
        @chef.profile = ''
        @chef.valid?
        expect(@chef.errors.full_messages).to include("Profile can't be blank")
      end
      it 'category_idが1だと登録できないこと' do
        @chef.category_id = 1
        @chef.valid?
        expect(@chef.errors.full_messages).to include("Category must be other than 1")
      end
      it 'areaが空だと登録できないこと' do
        @chef.area =''
        @chef.valid?
        expect(@chef.errors.full_messages).to include("Area can't be blank")
      end
      it 'fee_time_idが1だと登録できないこと' do
        @chef.fee_time_id = 1
        @chef.valid?
        expect(@chef.errors.full_messages).to include("Fee time must be other than 1")
      end
      it 'priceが空だと保存できないこと' do
        @chef.price = ''
        @chef.valid?
        expect(@chef.errors.full_messages).to include("Price can't be blank")
      end
      it '料金は半角数字以外だと保存できないこと' do
        @chef.price = 'Aあ'
        @chef.valid?
        expect(@chef.errors.full_messages).to include
      end
    end
  end
end
