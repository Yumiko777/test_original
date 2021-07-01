require 'rails_helper'

RSpec.describe Team, type: :model do

  before do
    @user = create(:user)
    team = create(:team, user: @user)
  end

  describe "バリデーションのテスト" do
    context "nameが空の場合" do
      it "バリデーションが通らない" do
        team = Team.new(name: nil)
        expect(team).not_to be_valid
      end
    end

    context "nameが記載の場合" do
      it "バリデーションが通る" do
        team = Team.new(name: 'テストチーム1' , user: @user )
        expect(team).to be_valid
      end
    end
  end

end
