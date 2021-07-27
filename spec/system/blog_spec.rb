require 'rails_helper'

RSpec.describe 'Blog', type: :system do
  before do
    @user = create(:user2)
    @blog = create(:blog, user: @user)
    visit new_user_session_path
    fill_in 'user[email]', with: @user.email
    fill_in 'user[password]', with: @user.password
    click_on 'Log in'
    visit blogs_path
  end

  describe '新規作成機能' do
    context 'blog新規投稿' do
      it '新規投稿画面が表示される' do
        visit new_blog_path
        fill_in :blog_title, with: 'Factoryで作ったデフォルトのタイトル1'
        fill_in :blog_content, with: 'Factoryで作ったデフォルトのコンテント1'
        click_on '新規投稿'
        expect(page).to have_content 'Factoryで作ったデフォルトのタイトル1'
        expect(page).to have_content 'テストユーザー2'
      end
    end
  end

  context 'ユーザーが本人の場合' do
    it 'blogを削除できる' do
      sleep 1
      first(:link, '削除').click
      expect(page).to have_content '削除する'
    end
  end

  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '作成済みのblog一覧が表示される' do
        visit blogs_path
        expect(page).to have_content 'テストユーザー2'
        expect(page).to have_content 'Factoryで作ったデフォルトのタイトル１'
      end
    end
  end

  describe '詳細表示機能' do
    context '任意のblog詳細画面に遷移した場合' do
      it '該当blogの内容が表示される' do
        visit blog_path(@blog)
        expect(page).to have_content 'Factoryで作ったデフォルトのタイトル１'
      end
    end
  end
end
