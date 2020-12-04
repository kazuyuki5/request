class Chef < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :fee_time
  belongs_to :user
  belongs_to :category
  has_one_attached :image


  with_options presence: true do
    validates :nickname
    validates :profile
    validates :area
    validates :price
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :fee_time_id
    end
  end
end
