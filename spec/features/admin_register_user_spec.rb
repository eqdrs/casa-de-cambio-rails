require 'rails_helper'

feature 'Admin register user' do
  scenario 'successfully' do
    visit root_path
    click_on 'Cadastrar usuário'
    fill_in 'Nome', with: 'Fulano Sicrano'
    fill_in 'E-mail', with: 'teste@teste.com'
    fill_in 'CPF', with: '451.894.135-78'
    click_on 'Cadastrar'

    expect(page).to have_css('h3', text: 'Fulano Sicrano')
    expect(page).to have_content('E-mail')
    expect(page).to have_content('teste@teste.com')
    expect(page).to have_content('CPF')
    expect(page).to have_content('451.894.135-78')
  end

  scenario 'and must fill all fields' do
    visit root_path
    click_on 'Cadastrar usuário'
    fill_in 'Nome', with: ''
    fill_in 'E-mail', with: ''
    fill_in 'CPF', with: ''
    click_on 'Cadastrar'

    expect(page).to have_content('Você deve informar todos os dados do '\
                                 'usuário')
  end
end
