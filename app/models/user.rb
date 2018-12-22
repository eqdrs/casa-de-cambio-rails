class User < ApplicationRecord
  has_many :transactions
  belongs_to :address, optional: true
  validates :email, :name, :cpf, presence: true
end
