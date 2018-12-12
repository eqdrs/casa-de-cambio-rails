require 'rails_helper'

feature 'Admin removes transaction' do
  scenario 'successfully' do
    transaction = Transaction.create(amount: 15, currency: 'real', quotation: 4,
                      transaction_type: 'buy')

    visit root_path
    click_on transaction.id
    click_on 'Apagar'

    expect(current_path).to eq root_path
    expect(page).to have_content('Transação apagada com sucesso!')
  end
end
