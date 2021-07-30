require 'rails_helper'

RSpec.describe 'Business', type: :system do
  before do
    @user = create(:user3)
    @business = create(:business, user: @user)
    visit new_user_session_path
    fill_in 'user[email]', with: @user.email
    fill_in 'user[password]', with: @user.password
    click_on 'Log in'
    visit businesses_path
  end

  describe '新規作成機能' do
    context '出勤状況登録' do
      it '出勤状況登録画面が表示される' do
        visit new_business_path
        fill_in :business_title, with: '勤怠管理'
        select '出勤', from: :business_status
        click_on '登録する'
        expect(page).to have_content '出勤'
        expect(page).to have_content '退勤'
      end
    end
  end

    context 'ユーザーが本人の場合' do
      it 'bisinessを削除できる' do
        sleep 1
        first(:link, '削除').click
        expect(page).to have_content '削除確認'
      end
    end

  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '作成済みのbisiness一覧が表示される' do
        visit businesses_path
        expect(page).to have_content '出勤状況一覧'
      end
    end
  end

  describe '詳細表示機能' do
    context '任意のbisiness詳細画面に遷移した場合' do
      it '該当bisinessの内容が表示される' do
        visit business_path(@business)
        expect(page).to have_content '編集'
      end
    end
  end
end
