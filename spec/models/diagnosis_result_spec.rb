# spec/models/diagnosis_result_spec.rb
require 'rails_helper'

RSpec.describe DiagnosisResult, type: :model do
  describe 'validations' do
    it '有効な属性であれば有効である' do
      expect(build(:diagnosis_result)).to be_valid
    end

    it '結果文がない場合は無効である' do
      diagnosis_result = build(:diagnosis_result, result_text: nil)
      expect(diagnosis_result).to_not be_valid
    end

    it 'キーがない場合は無効である' do
      diagnosis_result = build(:diagnosis_result, key: nil)
      expect(diagnosis_result).to_not be_valid
    end
  end
end
