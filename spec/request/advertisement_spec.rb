# frozen_string_literal: true

require 'rails_helper'

describe 'Advertisement', type: :request do
  let(:user) { Fabricate(:user) }
  let(:another) { Fabricate(:user) }
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
        user_creates_ad(user, kleidung, 'Test Title')
        visit category_path(kleidung.id)
        expect(page).to have_content('Test Title')
      end
    end
  end

  context 'when one user creates his ad' do
    context 'and tries to edit this ad' do
      it 'is able to edit his own ad even though he is not admin' do
        user_creates_ad(user, kleidung, 'Some Title')
        user_edits_ad(user, Advertisement.last)
        visit category_path(kleidung)
        expect(page).to have_content('Text has been changed!')
      end
    end

    context 'and other user tries to edit this ad' do
      it 'is unable to edit this ad' do
        user_creates_ad(user, kleidung, 'Rococo')
        sign_in another
        visit edit_advertisement_path(Advertisement.last.id)
        expect(page).to have_no_content('Rococo')
      end
    end

    context 'and admin tries to edit this ad' do
      it 'is able to edit this ad' do
        user_creates_ad(user, kleidung, 'Massimo Dutti')
        sign_in admin
        user_edits_ad(admin, Advertisement.last)
        visit category_path(kleidung)
        expect(page).to have_content('Text has been changed!')
      end
    end

    context 'and unlogged user tries to edit this ad' do
      it 'is unable to edit the ad' do
        user_creates_ad(user, kleidung, 'Carlo Pazzolini')
        sign_out user
        visit edit_advertisement_path(Advertisement.last.id)
        expect(page).to have_no_content('Carlo Pazzolini')
      end
    end
  end

  private

  def user_creates_ad(user, category, title)
    sign_in user
    visit new_advertisement_path
    fill_in('input_text', with: title)
    fill_in('textarea', with: Faker::Name.name)
    select(category.title, from: 'advertisement_category_id')
    click_button('Submit')
  end

  def user_edits_ad(_user, ad)
    visit edit_advertisement_path(ad.id)
    fill_in('input_text', with: 'Text has been changed!')
    fill_in('textarea', with: 'Text has been changed!')
    click_button('Submit')
  end
end
