require 'rails_helper'

RSpec.describe User, type: :model do
  describe "バリデーションのテスト" do
    let!(:user) { create(:user) }
    context "emailが空の場合" do
      it "バリデーションが通らない" do
        user = User.new(email: nil)
        expect(user).not_to be_valid
      end
    end

    context "usernameが空の場合" do
      it "バリデーションが通らない" do
        user = User.new(username: nil)
        expect(user).not_to be_valid
      end
    end

    context "emailとusernameが記載の場合" do
      it "バリデーションが通る" do
        user = User.new(username: 'テストユーザー3', email: 'test03@example.com', password: 'password03' )
        expect(user).to be_valid
      end
    end
  end
end
