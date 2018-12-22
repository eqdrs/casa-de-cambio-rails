class Address < ApplicationRecord
  has_many :users
  validates :street, :city, :state, :neighbourhood, :postal_code, presence: true
end
