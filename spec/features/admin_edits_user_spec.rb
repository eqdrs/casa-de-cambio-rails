require 'rails_helper'

feature 'Admin edits user' do
  scenario 'successfully' do
    user = User.create(email: 'teste@teste.com.br', name: 'Fulano Sicrano',
                       cpf: '451.894.135-78')

    visit root_path
    click_on 'Usuários'
    click_on user.id
    click_on 'Editar'
    fill_in 'Nome', with: 'Beltrano'
    fill_in 'E-mail', with: 'new_test@teste.com'
    fill_in 'CPF', with: '527.137.415-72'
    click_on 'Editar'

    expect(page).to have_css('h3', text: 'Beltrano')
    expect(page).to have_content('E-mail')
    expect(page).to have_content('new_test@teste.com')
    expect(page).to have_content('CPF')
    expect(page).to have_content('527.137.415-72')
  end

  scenario 'and must fill in all fields' do
    user = User.create(email: 'teste@teste.com.br', name: 'Fulano Sicrano',
                       cpf: '451.894.135-78')

    visit root_path
    click_on 'Usuários'
    click_on user.id
    click_on 'Editar'
    fill_in 'Nome', with: ''
    fill_in 'E-mail', with: ''
    fill_in 'CPF', with: ''
    click_on 'Editar'

    expect(page).to have_content('Você deve informar todos os dados do '\
                                 'usuário')
  end
end
