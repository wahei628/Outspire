require 'rails_helper'

RSpec.describe DiagnosisQuestion, type: :model do
  describe 'validations' do
    it '有効な属性であれば有効である' do
      expect(build(:diagnosis_question)).to be_valid
    end

    it '質問文がない場合は無効である' do
      diagnosis_question = build(:diagnosis_question, question_text: nil)
      expect(diagnosis_question).to_not be_valid
    end

    it 'ポイントがない場合は無効である' do
      diagnosis_question = build(:diagnosis_question, points: nil)
      expect(diagnosis_question).to_not be_valid
    end
  end
end
