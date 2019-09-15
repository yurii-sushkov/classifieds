require 'rails_helper'

describe 'Advertisement', type: :request do
  let(:user) { Fabricate(:user) }
  let(:admin) { Fabricate(:user, admin: true) }
  let!(:kleidung) { Fabricate(:category, title: 'Kleidung') }

  context 'when user tries to create a new advertisement' do
    context 'and is unauthenticated' do
      it 'cannot see new advertisement form and is redirected to login form' do
        visit new_advertisement_path
        expect(page).not_to have_selector('#new_advertisement')
      end
    end

    context 'and is authenticated' do
      it 'can see new advertisement form and is not redirected ti login form' do
        sign_in user
        visit new_advertisement_path
        find('#new_advertisement')
      end

      it 'can fill and submit new advertisement form' do
        sign_in user
        visit new_advertisement_path
        fill_in('input_text', with: 'Test Title')
        fill_in('textarea', with: Faker::Name.name)
        select(kleidung.title, from: 'advertisement_category_id')
        click_button('Submit')
        visit category_path(kleidung.id)
        expect(page).to have_content('Test Title')
      end
    end
  end
end
