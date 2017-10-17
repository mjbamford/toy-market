# Create Homes
Home.find_or_create_by! name: 'welcome'

if Rails.env.development?
  require 'factory_girl'
  include FactoryGirl::Syntax::Methods

  # Create Users
  sally = build :sallyseller
  (User.find_by username: sally.username) or sally.save!

  barry = build :barrybuyer
  (User.find_by username: barry.username) or barry.save!

  # Create Toys
  toy = build :teddy_bear, seller: sally
  (sally.toys_to_sell.find_by name: toy.name) or toy.save!

  toy = build :train, seller: barry
  (barry.toys_to_sell.find_by name: toy.name) or toy.save!
end
