FactoryGirl.define do
  factory :home do
  end

  factory :welcome_home, parent: :home do
    name 'welcome'
  end
end
