class RequestChef < ApplicationRecord
  belongs_to :user
  belongs_to :chef
  has_one    :address

end
