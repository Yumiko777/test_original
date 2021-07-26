require 'rails_helper'

RSpec.describe Work, type: :model do
  it 'start_timeが過去日付の場合バリデーションが通らない' do
    work = Work.new(title: '失敗テスト', content: '失敗テスト', start_time: "002021-07-01")
    expect(work).not_to be_valid
  end

  it 'titleが空の場合バリデーションが通らない' do
    work = Work.new(title: nil, start_time: "002021-12-31")
    expect(work).not_to be_valid
  end

  it 'contentが空の場合バリデーションが通らない' do
    work = Work.new(content: nil, start_time: "002021-12-31")
    expect(work).not_to be_valid
  end

  before do
    @user = create(:user)
  end
  it 'titleとcontentが記載の場合バリデーションが通る' do
    user = @user
    work = Work.new(title: '成功テスト', content: '成功テスト', start_time: Date.current, status: 0, remarks: '成功テスト',
                    user_id: 1)
    expect(work).to be_valid
  end
end
