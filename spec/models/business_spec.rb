require 'rails_helper'

RSpec.describe Business, type: :model do
  it 'titleが空の場合バリデーションが通らない' do
    business = Business.new(title: nil)
    expect(business).not_to be_valid
  end
end
