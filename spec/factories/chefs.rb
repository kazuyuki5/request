FactoryBot.define do
  factory :chef do
      nickname {Faker::Team.name}
      profile  {Faker::Lorem.sentence}
      category_id { 2 }
      area     {Faker::Team.name}
      fee_time_id  { 2 }
      price    { 6000 }
      association :user
      
      after(:build) do |chef|
        chef.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
      end
  end
end
