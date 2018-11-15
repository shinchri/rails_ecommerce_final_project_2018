# frozen_string_literal: true

class Customer < ApplicationRecord
  has_many :orders, dependent: :destroy
  belongs_to :tax_rate

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :address, presence: true
end
