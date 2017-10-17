require 'factory_girl'
include FactoryGirl::Syntax::Methods

# Create Homes
home = build :welcome_home
(Home.find_by name: home.name) or home.save!

if Rails.env.development?
  # Create Users
  sally = build :sallyseller
  (User.find_by username: sally.username) or sally.save!

  barry = build :barrybuyer
  (User.find_by username: barry.username) or barry.save!

  # Create Toys
  toy = build :teddy_bear, seller: sally
  (sally.toys_to_sell.find_by name: toy.name) or toy.save!
end
