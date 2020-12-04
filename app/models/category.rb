class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '和食' },
    { id: 3, name: '中華' },
    { id: 4, name: 'イタリアン' },
    { id: 5, name: 'フレンチ' },
    { id: 6, name: 'エスニック' },
    { id: 7, name: '家庭料理' },
    { id: 8, name: 'その他' },
  ]

  include ActiveHash::Associations
  has_many :chefs

  end