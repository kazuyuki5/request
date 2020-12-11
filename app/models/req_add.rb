class ReqAdd
  include ActiveModel::Model
  attr_accessor :user_id, :chef_id, :postal_code, :prefecture, :city, :house_number, :building_name, :phone_number, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :city
    validates :house_number
    validates :building_name
    validates :phone_number, numericality: { only_integer: true, maxlength: 11, message: 'is invalid. Input half-width characters.' }
    validates :token, presence: true
  end
  validates :prefecture, numericality: { other_than: 1, message: "can't be blank" }
  
  
  def save
   
    request_chef = RequestChef.create(chef_id: chef_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture: prefecture, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, request_chef_id: request_chef.id)
  end
end