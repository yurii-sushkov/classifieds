require 'rails_helper'

describe 'Category', type: :request do
  let(:user) { Fabricate(:user) }
  let(:admin) { Fabricate(:user, admin: true) }
  let(:kleidung) { Fabricate(:category) }

  context 'when user tries to create a new category' do
    context 'and it is not an admin' do
      it 'cannot to see \'new category\' form' do
        sign_in user
        visit new_category_path
        expect(page).to have_no_content('New Category')
      end
    end

    context 'and it is admin' do
      it 'can see \'new category\' form' do
        sign_in admin
        visit new_category_path
        expect(page).to have_content('New Category')
      end

      it 'can fill and submit \'new category\' form' do
        sign_in admin
        visit new_category_path
        fill_in('category_title', with: 'Одежа')
        fill_in('category_eng_title', with: 'Kleidung')
        fill_in('category_description', with: Faker::Name.name)
        select('attach_money', from: 'category_icon')
        click_button('Submit')
        expect(page).to have_content('Kleidung')
      end
    end
  end

  context 'when user tries to update an existing category' do
    context 'and it is not admin' do
      it 'cannot see an \'edit category\' page' do
        sign_in user

        visit edit_category_path(kleidung.id)
        expect(page).to have_no_content('Edit Category')
      end
    end

    context 'and it is an admin' do
      it 'can see an \'edit category\' page' do
        sign_in admin
        visit edit_category_path(kleidung.id)
        expect(page).to have_content('Edit Category')
      end

      it 'can edit and submit an \'edit category\' form' do
        sign_in admin
        visit edit_category_path(kleidung.id)
        fill_in('category_title', with: 'Одежа')
        fill_in('category_eng_title', with: 'Kleidung')
        fill_in('category_description', with: Faker::Name.name)
        select('attach_money', from: 'category_icon')
        click_button('Submit')
        expect(page).to have_content('Одежа')
      end
    end
  end
end
