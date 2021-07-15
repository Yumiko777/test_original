require 'rails_helper'

RSpec.describe 'Team', type: :system do
  before do
    @user = create(:user3)
    @team = create(:team, user: @user)
    visit new_user_session_path
    fill_in 'user[email]', with: @user.email
    fill_in 'user[password]', with: @user.password
    click_on 'Log in'
    visit teams_path
  end

  describe '新規作成機能' do
    context 'チーム新規登録' do
      it 'チーム新規作成画面が表示される' do
        visit new_team_path
        fill_in :team_name, with: 'テストチーム1'
        click_on '新規作成'
        expect(page).to have_content 'テストチーム1'
      end
    end

    context 'チーム作成者が本人でない場合' do
      it 'teamを削除できない' do
        sleep 1
        first(:link, 'テストチーム1').click
        # page.driver.browser.switch_to.alert.accept
        expect(page).to have_content '権限がありません!'
      end
    end
  end

  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '作成済みのteam一覧が表示される' do
        visit teams_path
        expect(page).to have_content 'テストチーム1'
      end
    end
  end

  describe '詳細表示機能' do
    context '任意のteam詳細画面に遷移した場合' do
      it '該当teamの内容が表示される' do
        visit teams_path
        expect(page).to have_content 'テストチーム1'
      end
    end
  end
end
