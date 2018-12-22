require 'rails_helper'

feature 'Admin view transaction detail' do
  scenario 'successfully' do
    user = User.create(email: 'teste@teste.com.br', name: 'Fulano Sicrano',
                       cpf: '451.894.135-78')
    transaction = Transaction.create(amount: 100, currency: 'dollar',
                                     quotation: 3.89, transaction_type: 'sell',
                                     user: user)

    visit root_path
    click_on transaction.id

    expect(page).to have_css('h3', text: 'Identificador')
    expect(page).to have_css('p', text: transaction.id)
    expect(page).to have_css('h3', text: 'Usuário')
    expect(page).to have_css('p', text: user.email)
    expect(page).to have_css('h3', text: 'Quantidade')
    expect(page).to have_css('p', text: '100')
    expect(page).to have_css('h3', text: 'Moeda')
    expect(page).to have_css('p', text: 'Dólar')
    expect(page).to have_css('h3', text: 'Cotação')
    expect(page).to have_css('p', text: '$ 3.89')
    expect(page).to have_css('h3', text: 'Tipo')
    expect(page).to have_css('p', text: 'Venda')
    expect(page).to have_css('h3', text: 'Data')
    expect(page).to have_css('p', text: Time.zone.today.strftime('%d/%m/%Y'))
    expect(page).to have_css('h3', text: 'Total')
    expect(page).to have_css('p', text: '$ -100.00')
  end

  scenario 'and return to recipe list' do
    user = User.create(email: 'teste@teste.com.br', name: 'Fulano Sicrano',
                       cpf: '451.894.135-78')
    transaction = Transaction.create(amount: 100, currency: 'dollar',
                                     quotation: 3.89, transaction_type: 'sell',
                                     user: user)

    visit root_path
    click_on transaction.id
    click_on 'Voltar'

    expect(current_path).to eq root_path
  end
end
