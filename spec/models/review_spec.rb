require 'rails_helper'

RSpec.describe Review, type: :model do
  describe 'associations' do
    it 'ユーザーに属している' do
      association = described_class.reflect_on_association(:user)
      expect(association.macro).to eq :belongs_to
    end
  end

  describe 'validations' do
    it '有効な属性であれば有効である' do
      expect(build(:review)).to be_valid
    end

    it 'タイトルがない場合は無効である' do
      review = build(:review, title: nil)
      expect(review).not_to be_valid
      expect(review.errors[:title]).to include("can't be blank")
    end

    it '内容がない場合は無効である' do
      review = build(:review, content: nil)
      expect(review).not_to be_valid
      expect(review.errors[:content]).to include("can't be blank")
    end
  end
end
