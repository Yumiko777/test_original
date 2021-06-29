require 'rails_helper'

RSpec.describe Work, type: :model do
  describe "バリデーションのテスト" do
    let!(:work) { create(:work) }
    context "titleが空の場合" do
      it "バリデーションが通らない" do
        work.title = nil
        expect(work).not_to be_valid
      end
    end

    context "contentが空の場合" do
      it "バリデーションが通らない" do
        work.content = nil
        expect(work).not_to be_valid
      end
    end

    context "titleとcontentが記載の場合" do
      it "バリデーションが通る" do
        work.title = '成功'
        work.content = '成功'
        expect(work).to be_valid
      end
    end
  end
end
