class Type < ApplicationRecord
  has_many :products

  validates :description, presence: true, uniqueness: true
end
