require 'rails_helper'

RSpec.describe Business, type: :model do
  before do
    @user = create(:user)
  end
  it 'titleに記載ありでstatusが出勤の場合バリデーションが通る' do
    user = @user
    business = Business.new(title: '成功テスト', status: 0, user_id: 1)
    expect(business).to be_valid
  end
end
