require 'rails_helper'

feature 'Admin filter by currency' do
  scenario 'successfully' do
    user = User.create(email: 'teste@teste.com.br', name: 'Fulano Sicrano',
                       cpf: '451.894.135-78')
    Transaction.create(amount: 100, currency: 'dollar',
                       quotation: 3.89, transaction_type: 'sell',
                       user: user)
    Transaction.create(amount: 70, currency: 'real',
                       quotation: 3.89, transaction_type: 'buy',
                       user: user)


    visit root_path
    select 'Dólar', from: 'Filtro por moeda'
    click_on 'Filtrar'

    expect(page).to have_content('Quantidade')
    expect(page).to have_content('100')
    expect(page).not_to have_content('70')
    expect(page).not_to have_content('Compra')
  end
  scenario 'and find nothing' do
    visit root_path
    select 'Dólar', from: 'Filtro por moeda'
    click_on 'Filtrar'

    expect(page).to have_content('Você ainda não possui'\
                                 ' transações cadastradas.')
  end
end
