require 'rails_helper'

RSpec.describe RequestChef, type: :model do
  before do
    @req_add = FactoryBot.build(:request_chef)
  end

  it "priceとtokenがあれば保存ができること" do
    expect(@req_add).to be_valid
  end

  it "priceが空では登録できないこと" do
    @req_add.price = nil
    @req_add.valid?
    expect(@req_add.errors.full_messages).to include("Price can't be blank")
  end

  it "tokenが空では登録できないこと" do
    @req_add.token = nil
    @req_add.valid?
    expect(@req_add.errors.full_messages).to include("Token can't be blank")
  end
end
