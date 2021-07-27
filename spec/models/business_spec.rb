require 'rails_helper'

RSpec.describe Business, type: :model do
  it 'titleが空の場合バリデーションが通らない' do
    business = Business.new(title: nil)
    expect(business).not_to be_valid
  end

  before do
    @user = create(:user)
  end
  it 'statusが退勤の場合バリデーションが通らない' do
    user = @user
    business = Business.new(title: '失敗テスト', status: 1 ,user_id: 1)
    expect(business).not_to be_valid
  end
end
