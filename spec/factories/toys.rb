FactoryGirl.define do
  factory :toy do
    name 'toy'
    association :seller, factory: :user
  end

  factory :teddy_bear, parent: :toy do
    name 'Teddy Bear'
    description 'A big brown teddy bear'
    image Rack::Test::UploadedFile.new Rails.root.join 'spec', 'fixtures', 'teddy-bear.jpg'
  end
end
