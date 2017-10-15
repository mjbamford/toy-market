class Message < ApplicationRecord
  belongs_to :sender,    class_name: 'User', foreign_key: 'sender_id'
  belongs_to :recipient, class_name: 'User', foreign_key: 'recipient_id'
  belongs_to :parent,    class_name: 'Message', optional: true
  has_one    :reply,     class_name: 'Message', foreign_key: 'parent_id'
end
