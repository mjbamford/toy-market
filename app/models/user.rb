class User < ApplicationRecord
  has_many :toys_to_sell, class_name: 'Toy', foreign_key: 'seller_id'
  has_many :toys_to_buy,  class_name: 'Toy', foreign_key: 'buyer_id'

  has_many :sent_messages,     class_name: 'Message', foreign_key: 'sender_id'
  has_many :received_messages, class_name: 'Message', foreign_key: 'recipient_id'
end
