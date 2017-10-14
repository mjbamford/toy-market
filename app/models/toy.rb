class Toy < ApplicationRecord
  validates :name, presence: true
  # belongs_to :seller, class: 'User'
  # belongs_to :buyer, class: 'User'
end
