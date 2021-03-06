require 'rails_helper'

RSpec.describe Blog, type: :model do
  it 'titleが空の場合バリデーションが通らない' do
    blog = Blog.new(title: nil)
    expect(blog).not_to be_valid
  end

  it 'contentが空の場合バリデーションが通らない' do
    blog = Blog.new(content: nil)
    expect(blog).not_to be_valid
  end

  it 'titleとcontentが記載の場合バリデーションが通る' do
    @user = create(:user)
    blog = Blog.new(title: '成功テスト', content: '成功テスト', user: @user)
    expect(blog).to be_valid
  end
end
