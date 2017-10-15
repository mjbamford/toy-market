FactoryGirl.define do
  factory :user do
  end

  factory :seller, parent: :user do
  end
end
