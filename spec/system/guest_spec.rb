require 'rails_helper'

RSpec.describe 'guest_login', type: :system do
  describe 'ゲストログイン機能' do
    context 'ゲストログインの場合' do
      it 'ゲストユーザーとしてログインできる' do
        visit root_path
        click_link 'ゲストログイン（閲覧用）'
        expect(page).not_to have_content 'ゲストログイン（閲覧用）'
      end
    end
  end
end
