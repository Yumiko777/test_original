require 'rails_helper'

RSpec.describe Member, type: :model do
  let!(:member) { create(:member) }
  it "関係性が有効" do
    expect(member).to be_valid
  end

  it "user_idがnilの場合は関係性が無効" do
    member.user_id = nil
    expect(member).not_to be_valid
  end

  it "team_idがnilの場合は関係性が無効" do
    member.team_id = nil
    expect(member).not_to be_valid
  end
end
