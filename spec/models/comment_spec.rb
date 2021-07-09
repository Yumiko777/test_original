require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'contentが空の場合バリデーションが通らない' do
    comment = Comment.new(content: nil)
    expect(comment).not_to be_valid
  end
end
