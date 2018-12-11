class Transaction < ApplicationRecord

  validates :amount, :quotation, :currency, :transaction_type, presence: true

  def real_to_dollar(quantity)
    quantity / self.quotation
  end

  def self.en_to_ptbr(word)
    return 'Dólar' if word == 'dollar'
    return 'Real' if word == 'real'
    return 'Venda' if word == 'sell'
    'Compra'
  end

  def date
    self.created_at.strftime('%d/%m/%Y')
  end
  
  def set_total
    if currency == 'dollar'
      transaction_type == 'buy' && self.update_attribute(:total, amount) or
      transaction_type == 'sell' && self.update_attribute(:total, -amount)
    else
      transaction_type == 'buy' && self.update_attribute(:total, real_to_dollar(amount))  or
      transaction_type == 'sell' && self.update_attribute(:total, real_to_dollar(-amount))
    end
    total
  end

end
