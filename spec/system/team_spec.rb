require 'rails_helper'

RSpec.describe 'Team', type: :system do
  before do
    @user = create(:admin)
    @team = create(:team, user: @user)
    @member = create(:member, team: @team, user: @user)
    visit new_user_session_path
    fill_in 'user[email]', with: @user.email
    fill_in 'user[password]', with: @user.password
    click_on 'Log in'
    visit team_path(@team)
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

    context '管理者はteamを削除できる' do
      it 'teamを削除できる' do
        sleep 1
        click_on 'チーム削除', match: :first
        expect(page).to have_content 'チーム削除'
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
        visit team_path(@team)
        expect(page).to have_content 'テストチーム1'
      end
    end
  end

  describe '管理者はチームにメンバーを追加できる' do
    context '任意のteam画面に遷移した場合' do
      it 'メンバーを追加できる' do
        visit team_path(Team.first.id)
        click_on 'メンバー追加'
        click_on '更新'
        expect(page).to have_content 'メンバーを追加しました！'
      end
    end
  end
end
