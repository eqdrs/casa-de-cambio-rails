require 'rails_helper'

feature 'Admin visit homepage' do
  scenario 'successfully' do
    visit root_path

    expect(page).to have_content('Bem-vindo ao sistema de trocas de moedas')
  end

  scenario 'and view a transaction' do
    user = User.create(email: 'teste@teste.com.br', name: 'Fulano Sicrano',
                       cpf: '451.894.135-78')
    transaction = Transaction.create(amount: 100, currency: 'dollar',
                                     quotation: 3.89,
                                     transaction_type: 'sell', user: user)

    visit root_path

    expect(page).to have_content('Identificador')
    expect(page).to have_content(transaction.id)
    expect(page).to have_content('Quantidade')
    expect(page).to have_content('100')
    expect(page).to have_content('Moeda')
    expect(page).to have_content('Dólar')
    expect(page).to have_content('Tipo')
    expect(page).to have_content('Venda')
    expect(page).to have_content('Total')
    expect(page).to have_content('$ -100.00')
  end

  scenario 'and view multiple transactions' do
    user = User.create(email: 'teste@teste.com.br', name: 'Fulano Sicrano',
                       cpf: '451.894.135-78')
    transaction = Transaction.create(amount: 100, currency: 'dollar',
                                     quotation: 3.89, transaction_type: 'sell',
                                     user: user)
    other_transaction = Transaction.create(amount: 150, currency: 'real',
                                           quotation: 4,
                                           transaction_type: 'buy',
                                           user: user)

    visit root_path

    expect(page).to have_content('Identificador')
    expect(page).to have_content('Quantidade')
    expect(page).to have_content('Moeda')
    expect(page).to have_content('Tipo')
    expect(page).to have_content('Total')

    expect(page).to have_content(transaction.id)
    expect(page).to have_content('100')
    expect(page).to have_content('Dólar')
    expect(page).to have_content('Venda')
    expect(page).to have_content('$ -100.00')

    expect(page).to have_content(other_transaction.id)
    expect(page).to have_content('150')
    expect(page).to have_content('Real')
    expect(page).to have_content('Compra')
    expect(page).to have_content('$ 37.50')
  end

  scenario 'and has no transactions' do
    visit root_path

    expect(page).to have_content('Você ainda não possui transações cadastradas')
  end
end
