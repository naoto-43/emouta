require 'rails_helper'

RSpec.describe PostComment, type: :model do
  describe 'validations' do
    subject { FactoryBot.build(:post_comment) }
    let(:user) { create(:user) }
    let(:post) { create(:post) }
    subject { FactoryBot.build(:post_comment, user:, post:) }

    it 'is valid with a valid comment' do
      expect(subject).to be_valid
    end

    it 'is invalid without a comment' do
      subject.comment = nil
      expect(subject).not_to be_valid
      expect(subject.errors[:comment]).to include('を入力してください')
    end

    it 'is invalid without a user' do
      subject.user = nil
      expect(subject).not_to be_valid
      expect(subject.errors[:user]).to include('を入力してください')
    end

    it 'is invalid without a post' do
      subject.post = nil
      expect(subject).not_to be_valid
      expect(subject.errors[:post]).to include('を入力してください')
    end
  end

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:post) }
  end
end
