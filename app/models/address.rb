class Address < ApplicationRecord
  has_one :user
  validates :street, :city, :state, :neighbourhood, :postal_code, presence: true
end
