require 'rails_helper'

feature 'Admin view user profile' do
  scenario 'successfully' do
    address = Address.create(street: 'Av. Paulista 1293', city: 'São Paulo',
                             state: 'São Paulo',
                             neighbourhood: 'Cerqueira César',
                             postal_code: '01419-001')
    user = User.create(email: 'teste@teste.com.br', name: 'Fulano Sicrano',
                       cpf: '451.894.135-78', address: address)

    visit root_path
    click_on 'Usuários'
    click_on user.id

    expect(page).to have_css('h3', text: 'Fulano Sicrano')
    expect(page).to have_content('E-mail')
    expect(page).to have_content('teste@teste.com')
    expect(page).to have_content('CPF')
    expect(page).to have_content('451.894.135-78')
    expect(page).to have_content('Endereço')
    expect(page).to have_content('Av. Paulista 1293')
    expect(page).to have_content('Cerqueira César')
    expect(page).to have_content('São Paulo - São Paulo')
    expect(page).to have_content('01419-001')
  end

  scenario 'and don\'t have address' do
    user = User.create(email: 'teste@teste.com.br', name: 'Fulano Sicrano',
                       cpf: '451.894.135-78')

    visit root_path
    click_on 'Usuários'
    click_on user.id

    expect(page).to have_css('h3', text: 'Fulano Sicrano')
    expect(page).to have_content('E-mail')
    expect(page).to have_content('teste@teste.com')
    expect(page).to have_content('CPF')
    expect(page).to have_content('451.894.135-78')
    expect(page).to have_content('Endereço')
    expect(page).to have_content('Este usuário não tem um endereço cadastrado')
  end

  scenario 'and don\'t have any registered user' do
    visit root_path
    click_on 'Usuários'

    expect(page).to have_content('Nenhum usuário cadastrado')
  end
end
