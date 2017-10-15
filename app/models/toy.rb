class Toy < ApplicationRecord
  validates :name, presence: true

  has_attached_file :image, styles: { thumb: '300x300>' }

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  belongs_to :seller, class_name: 'User'
  belongs_to :buyer,  class_name: 'User', optional: true
end
