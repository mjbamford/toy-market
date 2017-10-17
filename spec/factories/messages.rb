FactoryGirl.define do
  factory :message, aliases: [ :message_from_sally_to_barry ] do
    association :sender, factory: :sallyseller
    association :recipient, factory: :barrybuyer
  end

  factory :message_from_barry_to_sally do
    association :sender, factory: :barrybuyer
    association :recipient, factory: :sallyseller
  end
end
