FactoryGirl.define do
  factory :user do
  end

  factory :seller, aliases: [ :sallyseller ], parent: :user do
    username   :sallyseller
    first_name :Sally
    last_name  :Seller
  end

  factory :buyer, aliases: [ :barrybuyer ], parent: :user do
    username   :barrybuyer
    first_name :Barry
    last_name  :Buyer
  end
end
