class User < ApplicationRecord
  has_many :transactions
  validates :email, :name, :cpf, presence: true
end
