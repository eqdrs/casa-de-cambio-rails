require 'rails_helper'

feature 'Admin edits transaction' do
  scenario 'successfully' do
    user = User.create(email: 'teste@teste.com.br', name: 'Fulano Sicrano',
                       cpf: '451.894.135-78')
    transaction = Transaction.create(amount: 15, currency: 'real', quotation: 4,
                                     transaction_type: 'buy', user: user)

    visit root_path
    click_on transaction.id
    click_on 'Editar'
    fill_in 'Quantidade', with: 100
    select 'Dólar', from: 'Moeda'
    fill_in 'Cotação', with: 3.89
    select 'Venda', from: 'Tipo'
    click_on 'Editar'

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

  scenario 'and must fill in all fields' do
    user = User.create(email: 'teste@teste.com.br', name: 'Fulano Sicrano',
                       cpf: '451.894.135-78')
    transaction = Transaction.create(amount: 15, currency: 'real', quotation: 4,
                                     transaction_type: 'buy', user: user)

    visit root_path
    click_on transaction.id
    click_on 'Editar'
    fill_in 'Quantidade', with: ''
    fill_in 'Cotação', with: ''
    click_on 'Editar'

    expect(page).to have_content('Você deve informar todos os dados da '\
                                 'transação')
  end
end
