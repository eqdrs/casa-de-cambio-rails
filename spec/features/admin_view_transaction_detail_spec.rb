require 'rails_helper'

feature 'Admin view transaction detail' do
  scenario 'successfully' do
    transaction = Transaction.create(amount: 100, currency: 'dollar', quotation: 3.89,
                      transaction_type: 'sell')

    visit root_path
    click_on transaction.id

    expect(page).to have_css('h3', text: 'Identificador')
    expect(page).to have_css('p', text: transaction.id)
    expect(page).to have_css('h3', text: 'Quantidade')
    expect(page).to have_css('p', text: '100')
    expect(page).to have_css('h3', text: 'Moeda')
    expect(page).to have_css('p', text: 'Dólar')
    expect(page).to have_css('h3', text: 'Cotação')
    expect(page).to have_css('p', text: '$ 3.89')
    expect(page).to have_css('h3', text: 'Tipo')
    expect(page).to have_css('p', text: 'Venda')
    expect(page).to have_css('h3', text: 'Data')
    expect(page).to have_css('p', text: transaction.created_at.strftime('%d/%m/%Y'))
    expect(page).to have_css('h3', text: 'Total')
    expect(page).to have_css('p', text: '$ -100.00')
  end

  scenario 'and return to recipe list' do
    transaction = Transaction.create(amount: 100, currency: 'dollar', quotation: 3.89,
                      transaction_type: 'sell')

    visit root_path
    click_on transaction.id
    click_on 'Voltar'

    expect(current_path).to eq root_path
  end
end
