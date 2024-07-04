require 'rails_helper'

RSpec.describe DiagnosisQuestion, type: :model do
  describe 'associations' do
    it '多くの診断結果を持つ' do
      association = described_class.reflect_on_association(:diagnosis_results)
      expect(association.macro).to eq :has_many
      expect(association.options[:dependent]).to eq :destroy
    end

    it '多くのユーザー回答を持つ' do
      association = described_class.reflect_on_association(:user_answers)
      expect(association.macro).to eq :has_many
      expect(association.options[:dependent]).to eq :destroy
    end
  end

  describe 'validations' do
    it '有効な属性であれば有効である' do
      expect(build(:diagnosis_question)).to be_valid
    end

    it 'カテゴリーIDがない場合は無効である' do
      diagnosis_question = build(:diagnosis_question, category_id: nil)
      expect(diagnosis_question).not_to be_valid
      expect(diagnosis_question.errors[:category_id]).to include("can't be blank")
    end

    it '重みが1未満の場合は無効である' do
      diagnosis_question = build(:diagnosis_question, weight: 0)
      expect(diagnosis_question).not_to be_valid
      expect(diagnosis_question.errors[:weight]).to include('must be greater than or equal to 1')
    end
  end
end
