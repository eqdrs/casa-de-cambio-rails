class Address < ApplicationRecord
  belongs_to :user, optional: true
  validates :street, :city, :state, :neighbourhood, :postal_code, presence: true
end
