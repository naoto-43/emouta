require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validations' do
    subject { FactoryBot.build(:post) }

    it 'is valid with valid attributes' do
      expect(subject).to be_valid
      expect(subject.errors).to be_empty
    end

    it 'is invalid without lyrics' do
      subject.lyrics = nil
      expect(subject).not_to be_valid
      expect(subject.errors[:lyrics]).to include("を入力してください")
    end

    it 'is invalid without a song_title' do
      subject.song_title = nil
      expect(subject).not_to be_valid
      expect(subject.errors[:song_title]).to include("を入力してください")
    end

    it 'is invalid without an artist' do
      subject.artist = nil
      expect(subject).not_to be_valid
      expect(subject.errors[:artist]).to include("を入力してください")
    end

    it 'is invalid when song_title exceeds 255 characters' do
      subject.song_title = 'a' * 256
      expect(subject).not_to be_valid
      expect(subject.errors[:song_title]).to include("は255文字以内で入力してください")
    end

    it 'is invalid when lyrics exceed 65535 characters' do
      subject.lyrics = 'a' * 65536
      expect(subject).not_to be_valid
      expect(subject.errors[:lyrics]).to include("は65535文字以内で入力してください")
    end
  end

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:post_comments).dependent(:destroy) }
    it { is_expected.to have_many(:post_tags).dependent(:destroy) }
    it { is_expected.to have_many(:tags).through(:post_tags) }
  end
end
