require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    let(:user) { build(:user) }

    it '有効な属性の場合は有効である' do
      expect(user).to be_valid
    end

    it '名前がない場合は無効である' do
      user.name = nil
      expect(user).not_to be_valid
      expect(user.errors[:name]).to include("can't be blank")
    end

    it 'メールアドレスがない場合は無効である' do
      user.email = nil
      expect(user).not_to be_valid
      expect(user.errors[:email]).to include("can't be blank")
    end

    it '同じメールアドレスは無効である' do
      create(:user, email: user.email)
      expect(user).not_to be_valid
      expect(user.errors[:email]).to include('has already been taken')
    end

    it 'パスワードが3文字未満は無効である' do
      user.password = '12'
      user.password_confirmation = '12'
      expect(user).not_to be_valid
      expect(user.errors[:password]).to include('is too short (minimum is 3 characters)')
    end

    it 'パスワード確認がない場合は無効である' do
      user.password_confirmation = nil
      expect(user).not_to be_valid
      expect(user.errors[:password_confirmation]).to include("can't be blank")
    end

    it 'リセットパスワードトークンがなくても有効である' do
      user.reset_password_token = nil
      expect(user).to be_valid
    end

    it '重複するリセットパスワードトークンがある場合は無効である' do
      create(:user, reset_password_token: 'unique_token')
      user.reset_password_token = 'unique_token'
      expect(user).not_to be_valid
      expect(user.errors[:reset_password_token]).to include('has already been taken')
    end
  end

  describe 'associations' do
    it '多くのuser_answersを持つ' do
      association = described_class.reflect_on_association(:user_answers)
      expect(association.macro).to eq :has_many
      expect(association.options[:dependent]).to eq :destroy
    end

    it '多くのauthenticationsを持つ' do
      association = described_class.reflect_on_association(:authentications)
      expect(association.macro).to eq :has_many
      expect(association.options[:dependent]).to eq :destroy
    end

    it '多くのreviewsを持つ' do
      association = described_class.reflect_on_association(:reviews)
      expect(association.macro).to eq :has_many
      expect(association.options[:dependent]).to eq :destroy
    end
  end
end
