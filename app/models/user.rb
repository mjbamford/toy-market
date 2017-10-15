class User < ApplicationRecord
  has_many :toys_to_sell, class_name: 'Toy', foreign_key: 'seller_id'
  has_many :toys_to_buy,  class_name: 'Toy', foreign_key: 'buyer_id'
end
