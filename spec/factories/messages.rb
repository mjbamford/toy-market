FactoryGirl.define do
  factory :message do
    association :sender, factory: :sallyseller
    association :recipient, factory: :barrybuyer
  end
end
