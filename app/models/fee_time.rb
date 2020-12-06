class FeeTime < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '10:00~13:00' },
    { id: 3, name: '13:00~16:00' },
    { id: 4, name: '16:00~19:00' },
  ]

  include ActiveHash::Associations
  has_many :chefs

  end