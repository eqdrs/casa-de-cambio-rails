class User < ApplicationRecord
  has_many :transactions
  has_one :address
  validates :email, :name, :cpf, presence: true
end
