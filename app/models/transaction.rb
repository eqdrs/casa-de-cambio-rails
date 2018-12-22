class Transaction < ApplicationRecord
  belongs_to :user
  validates :amount, :quotation, :currency, :transaction_type, presence: true
  
  def real_to_dollar(quantity)
    quantity / quotation
  end

  def self.en_to_ptbr(word)
    return 'Dólar' if word == 'dollar'
    return 'Real' if word == 'real'
    return 'Venda' if word == 'sell'
    'Compra'
  end

  def date
    created_at.strftime('%d/%m/%Y')
  end
  
  def set_total
    currency == 'real' ? total = real_to_dollar(amount) : total = amount
    transaction_type == 'sell' && total = -total
    self.update_attribute(:total, total)
    total
  end

end
