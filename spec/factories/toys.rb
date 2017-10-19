FactoryGirl.define do
  factory :toy do
    name 'toy'
    price 10.01
    association :seller, factory: :user
  end

  factory :teddy_bear, parent: :toy do
    name 'Teddy Bear'
    description 'A big brown teddy bear'
    image Rack::Test::UploadedFile.new Rails.root.join 'spec', 'fixtures', 'teddy-bear.jpg'
  end

  factory :train, parent: :toy do
    name 'Train Set'
    description 'A wodden train'
    image Rack::Test::UploadedFile.new Rails.root.join 'spec', 'fixtures', 'train.jpg'
  end
end
