require 'rails_helper'

RSpec.describe 'Comment', type: :system do

  before do
    @user = create(:user)
    @blog = create(:blog, user: @user)
    @comment = create(:comment, blog: @blog, user: @user)
    visit new_user_session_path
    fill_in 'user[email]', with: @user.email
    fill_in 'user[password]', with: @user.password
    click_on 'Log in'
    visit blog_path(@blog)
  end

  describe '投稿に対してコメントを投稿機能' do
    context '投稿にコメントした場合' do
      it '投稿にコメントが投稿される' do
        fill_in "comment[content]", with: 'おはよう'
        click_on 'コメントをする'
        expect(page).to have_content '投稿日'
      end
    end

    context '投稿したコメントの編集ボタンを押した場合' do
      it 'コメントを編集できる' do
        click_on 'コメント編集', match: :first
        expect(page).to have_content 'おはよう'
        click_on '更新'
        expect(page).to have_content 'コメントが編集されました!'
      end
    end

    context '投稿したコメントの削除ボタンを押した場合' do
      it 'コメントを削除できる' do
        click_on 'コメント削除', match: :first
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content 'コメントが削除されました!'
      end
    end
  end
end
