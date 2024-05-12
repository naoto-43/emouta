require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe 'validations' do
    subject { FactoryBot.build(:tag) }

    it 'is valid with a valid name' do
      expect(subject).to be_valid
    end

    it 'is invalid without a name' do
      subject.name = nil
      expect(subject).not_to be_valid
      expect(subject.errors[:name]).to include("を入力してください")
    end

    it 'is invalid with a name longer than 12 characters' do
      subject.name = 'a' * 13
      expect(subject).not_to be_valid
      expect(subject.errors[:name]).to include("は12文字以内で入力してください")
    end
  end

  describe 'associations' do
    it { is_expected.to have_many(:post_tags).dependent(:destroy) }
    it { is_expected.to have_many(:posts).through(:post_tags) }
  end
end
