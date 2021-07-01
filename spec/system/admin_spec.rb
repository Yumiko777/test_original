require 'rails_helper'

RSpec.describe 'Admin', type: :system do

  describe '管理者登録のテスト' do
    context '管理者登録がなくログインしていない場合' do
      it '管理者新規登録のテスト' do
        visit new_user_registration_path
        fill_in 'user[username]', with: 'テストアドミン'
        fill_in 'user[email]', with: 'test04@example.com'
        fill_in 'user[password]', with: 'password04'
        fill_in 'user[password_confirmation]', with: 'password04'
        click_on '新規登録'
        expect(page).to have_content 'Sign up'
      end
      it '​ログインしていない時はログイン画面に飛ぶテスト​' do
        visit works_path
        expect(current_path).to eq new_user_session_path
      end
    end
  end

  describe "管理画面のテスト" do
    context "管理者でログインしている場合" do
      it "管理者は管理画面にアクセスできること" do
        create(:admin)
        visit new_user_session_path
        fill_in 'user[email]', with: 'test04@example.com'
        fill_in 'user[password]', with: 'password04'
        click_on "Log in"
        visit admin_users_path
        expect(page).to have_content 'サイト管理'
      end
    end
  end
end
