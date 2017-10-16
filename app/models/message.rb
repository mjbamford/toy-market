class Message < ApplicationRecord
  belongs_to :sender,    class_name: 'User', foreign_key: 'sender_id'
  belongs_to :recipient, class_name: 'User', foreign_key: 'recipient_id'
  belongs_to :root,      class_name: 'Message', optional: true
  belongs_to :parent,    class_name: 'Message', optional: true
  has_one    :reply,     class_name: 'Message', foreign_key: 'parent_id'

  scope :roots, -> { where(parent_id: nil) }

  after_create do
    update_column :root_id, (parent_id.nil? ? self.id : parent.root_id)
  end
end
