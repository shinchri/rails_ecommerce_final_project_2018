# frozen_string_literal: true

class TaxRate < ApplicationRecord
  has_many :customers

  validates :province_name, presence: true, uniqueness: true
  validates :pst, presence: true, allow_nil: true
  validates :gst, presence: true, allow_nil: true
  validates :hst, presence: true, allow_nil: true
end
