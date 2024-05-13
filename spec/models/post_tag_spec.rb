require 'rails_helper'

RSpec.describe PostTag, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:post) }
    it { is_expected.to belong_to(:tag) }
  end

  describe 'validations' do
    let(:post) { create(:post) }
    let(:tag) { create(:tag) }
    let(:another_tag) { create(:tag) }  # another_tagを定義している

    subject { build(:post_tag, post: post, tag: tag) }

    it 'is valid with valid post and tag' do
      expect(subject).to be_valid
    end

    it 'is invalid without a post' do
      subject.post = nil
      expect(subject).not_to be_valid
      expect(subject.errors[:post]).to include("を入力してください")
    end

    it 'is invalid without a tag' do
      subject.tag = nil
      expect(subject).not_to be_valid
      expect(subject.errors[:tag]).to include("を入力してください")
    end

    context 'uniqueness validation' do
      before { create(:post_tag, post: post, tag: tag) }  # 重複するデータをあらかじめ作成

      it 'is valid with a unique post and tag combination' do
        new_post_tag = build(:post_tag, post: post, tag: another_tag)
        expect(new_post_tag).to be_valid
      end

      it 'is invalid with a duplicate post_tag combination' do
        duplicate_post_tag = build(:post_tag, post: post, tag: tag)
        expect(duplicate_post_tag).not_to be_valid
        expect(duplicate_post_tag.errors[:tag_id]).to include("はすでに存在します")
      end
    end
  end
end
