require 'rails_helper'

RSpec.describe 'User', type: :system do
  describe 'ユーザ登録のテスト' do
    context 'ユーザ登録がなくログインしていない場合' do
      it 'ユーザ新規登録のテスト' do
        visit new_user_registration_path
        fill_in 'user[username]', with: 'テストユーザー2'
        fill_in 'user[email]', with: 'test02@example.com'
        fill_in 'user[password]', with: 'password02'
        fill_in 'user[password_confirmation]', with: 'password02'
        click_on 'Sign up'
        expect(page).to have_content 'テストユーザー2'
      end
      it '​ログインしていない時はログイン画面に飛ぶテスト​' do
        visit works_path
        expect(current_path).to eq new_user_session_path
      end
    end
  end

  describe 'session機能テスト' do
    before do
      @user = create(:user)
    end

    context 'ログインしていない状態でユーザデータがある場合' do
      it 'ログインができること' do
        visit new_user_session_path
        fill_in 'user[email]', with: @user.email
        fill_in 'user[password]', with: @user.password
        click_on 'Log in'
        expect(current_path).to eq user_path(id: @user.id)
      end
    end

    context 'ログインしている場合' do
      before do
        visit new_session_path
        fill_in 'user[email]', with: @user.email
        fill_in 'user[password]', with: @user.password
        click_on 'Log in'
      end
    end

    it 'ログアウトできる' do
      visit new_user_session_path
      fill_in 'user[email]', with: 'test02@example.com'
      fill_in 'user[password]', with: 'password02'
      expect(page).to have_content 'Log in'
    end
  end
end
