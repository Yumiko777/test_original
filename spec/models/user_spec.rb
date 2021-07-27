require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = create(:user)
  end

  describe 'バリデーションのテスト' do
    it '全ての項目が記載されている場合バリデーションが通る' do
      expect(@user).to be_valid
    end

    it 'usernameが空の場合バリデーションが通らない' do
      @user.username = nil
      expect(@user.valid?).to eq(false)
    end

    it 'usernameが30文字以上の場合バリデーションが通らない' do
      @user.username = 'a' * 31
      expect(@user.valid?).to eq(false)
    end

    it 'emailが空の場合バリデーションが通らない' do
      @user.email = nil
      expect(@user.valid?).to eq(false)
    end

    it 'パスワードが６文字以下の場合NG' do
      @user.password =  '12345'
      @user.valid?
      expect(@user.errors[:password]).to include('は6文字以上で入力してください')
    end
  end
end
