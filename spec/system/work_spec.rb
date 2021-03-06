require 'rails_helper'

RSpec.describe 'Work', type: :system do
  before do
    @user = create(:user2)
    @work = create(:work, user: @user)
    visit new_user_session_path
    fill_in 'user[email]', with: @user.email
    fill_in 'user[password]', with: @user.password
    click_on 'Log in'
    visit works_path
  end

  describe '新規作成機能' do
    context '作業内容新規作成' do
      it '新規投稿画面が表示される' do
        visit new_work_path
        fill_in :work_title, with: 'Factoryで作ったデフォルトのタイトル1'
        fill_in :work_content, with: 'Factoryで作ったデフォルトのコンテント1'
        select '2021', from: :work_start_time_1i
        select '7月', from: :work_start_time_2i
        select '31', from: :work_start_time_3i
        choose 'status_false'
        fill_in :work_remarks, with: 'Factoryで作ったデフォルトの備考2'
        click_on '新規作成'
        expect(page).to have_content '1件のエラーがあります'
        expect(page).to have_content '作業日は今日以降の日付を選択してください'
      end
    end

    context 'ユーザーが本人の場合' do
      it 'workを削除できる' do
        sleep 1
        first(:link, '削除').click
        expect(page).to have_content '削除確認'
      end
    end

    context 'ユーザーが本人の場合' do
      it 'workを編集できる' do
        sleep 2
        first(:link, '編集').click
        fill_in 'work[title]', with: 'Factoryで作ったデフォルトのタイトル1'
        fill_in 'work[content]', with: 'Factoryで作ったデフォルトのコンテント1'
        click_button '編集'
        expect(page).to have_content 'Factoryで作ったデフォルトのタイトル1'
        expect(page).to have_content 'Factoryで作ったデ...'
      end
    end
  end

  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '作成済みのwork一覧が表示される' do
        visit works_path
        expect(page).to have_content 'スケジュール一覧'
      end
    end
  end

  describe '詳細表示機能' do
    context '任意のwork詳細画面に遷移した場合' do
      it '該当workの内容が表示される' do
        visit work_path(@work)
        expect(page).to have_content '編集'
      end
    end
  end
end
