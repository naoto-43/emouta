require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    subject { FactoryBot.build(:user) }

    it 'is valid with valid attributes' do
      expect(subject).to be_valid
      expect(subject.errors).to be_empty
    end

    it 'is invalid without an email' do
      subject.email = nil
      expect(subject).not_to be_valid
      expect(subject.errors[:email]).to include('を入力してください')
    end

    it 'is invalid with a duplicate email' do
      existing_user = create(:user, email: 'test@example.com')
      user_with_duplicate_email = build(:user, email: 'test@example.com')
      expect(user_with_duplicate_email).not_to be_valid
      expect(user_with_duplicate_email.errors[:email]).to include('はすでに存在します')
    end

    it 'is invalid without a password' do
      subject.password = nil
      expect(subject).not_to be_valid
      expect(subject.errors[:password]).to include('を入力してください')
    end
  end

  describe 'associations' do
    it { is_expected.to have_many(:posts).dependent(:destroy) }
    it { is_expected.to have_many(:post_comments).dependent(:destroy) }
  end

  describe '#own?' do
    let(:user) { create(:user) }
    let(:another_user) { create(:user) }
    let(:post) { create(:post, user:) }
    let(:another_post) { create(:post, user: another_user) }

    it 'returns true if the user owns the object' do
      expect(user.own?(post)).to be true
    end

    it 'returns false if the user does not own the object' do
      expect(user.own?(another_post)).to be false
    end
  end
end
