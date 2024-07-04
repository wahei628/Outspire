require 'rails_helper'

RSpec.describe UserAnswer, type: :model do
  describe 'associations' do
    it 'ユーザーに属している' do
      association = described_class.reflect_on_association(:user)
      expect(association.macro).to eq :belongs_to
    end

    it '診断質問に属している' do
      association = described_class.reflect_on_association(:diagnosis_question)
      expect(association.macro).to eq :belongs_to
    end
  end
end
