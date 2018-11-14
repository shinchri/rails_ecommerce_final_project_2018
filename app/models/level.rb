# frozen_string_literal: true

class Level < ApplicationRecord
  has_many :products

  validates :description, presence: true, uniqueness: true
end
