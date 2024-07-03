require 'rails_helper'

RSpec.describe Authentication, type: :model do
  describe 'associations' do
    it 'ユーザーに属している' do
      association = described_class.reflect_on_association(:user)
      expect(association.macro).to eq :belongs_to
    end
  end
end
