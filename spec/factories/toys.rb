FactoryGirl.define do
  factory :toy do
    name 'toy'
    association :seller, factory: :user
  end

  factory :teddy_bear, parent: :toy do
    name 'Teddy Bear'
    description 'A big brown teddy bear'
    price 29.95
    image Rack::Test::UploadedFile.new Rails.root.join 'spec', 'fixtures', 'teddy-bear.jpg'
  end

  factory :train, parent: :toy do
    name 'Train Set'
    description 'A wodden train'
    price 12.45
    image Rack::Test::UploadedFile.new Rails.root.join 'spec', 'fixtures', 'train.jpg'
  end
end
