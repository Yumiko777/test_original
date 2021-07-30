require 'rails_helper'

RSpec.describe Business, type: :model do
  before do
    @user = create(:user)
    user = @user
  end

  it 'titleが空の場合バリデーションが通らない' do
    business = Business.new(title: nil, status: 0, user_id: 1)
    expect(business).not_to be_valid
  end

  it 'titleに記載ありでstatusが出勤の場合バリデーションが通る' do
    business = Business.new(title: '成功テスト', status: 0, user_id: 1)
    expect(business).to be_valid
  end

  it 'statusが退勤の場合バリデーションが通らない' do
    user = @user
    business = Business.new(title: '失敗テスト', status: 1 ,user_id: 1)
    expect(business).not_to be_valid
  end
end
