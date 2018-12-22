require 'rails_helper'

feature 'Admin removes transaction' do
  scenario 'successfully' do
    user = User.create(email: 'teste@teste.com.br', name: 'Fulano Sicrano',
                       cpf: '451.894.135-78')
    transaction = Transaction.create(amount: 15, currency: 'real', quotation: 4,
                                     transaction_type: 'buy', user: user)

    visit root_path
    click_on transaction.id
    click_on 'Apagar'

    expect(current_path).to eq root_path
    expect(page).to have_content('Transação apagada com sucesso!')
  end
end
