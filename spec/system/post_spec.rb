require 'rails_helper'

RSpec.describe Post, type: :system do
  let(:user) { create(:user) }
  before { login(user) }

  describe '投稿作成' do
    context 'フォームの入力値が正常' do
      it '投稿の新規作成が成功' do
        save_and_open_page
        element = find('.btn-primary', text: '投稿')
        expect(element).to be_visible
        element.click
        fill_in 'post_lyrics', with: 'test lyrics'
        fill_in 'post_song_title', with: 'test title'
        fill_in 'post_artist', with: 'test artist'
        fill_in 'post_tags', with: 'test,tags'
        fill_in 'post_story', with: 'test story'
        fill_in 'link_to_music', with: 'test url'
        click_button '投稿'
        expect(page).to have_content '投稿が正常に作成されました。'
        expect(current_path).to eq root_path
      end
    end

    context '歌詞未記入' do
      it '投稿の新規作成が失敗' do
        save_and_open_page
        element = find('.btn-primary', text: '投稿')
        expect(element).to be_visible
        element.click
        fill_in 'post_lyrics', with: ''
        fill_in 'post_song_title', with: 'test title'
        fill_in 'post_artist', with: 'test artist'
        fill_in 'post_tags', with: 'test,tags'
        fill_in 'post_story', with: 'test story'
        fill_in 'link_to_music', with: 'test url'
        click_button '投稿'
        expect(page).to have_content '歌詞を入力してください'
      end
    end

    context '曲名未記入' do
      it '投稿の新規作成が失敗' do
        save_and_open_page
        element = find('.btn-primary', text: '投稿')
        expect(element).to be_visible
        element.click
        fill_in 'post_lyrics', with: 'test lyrics'
        fill_in 'post_song_title', with: ''
        fill_in 'post_artist', with: 'test artist'
        fill_in 'post_tags', with: 'test,tags'
        fill_in 'post_story', with: 'test story'
        fill_in 'link_to_music', with: 'test url'
        click_button '投稿'
        expect(page).to have_content '曲名を入力してください'
      end
    end

    context 'アーティスト未記入' do
      it '投稿の新規作成が失敗' do
        save_and_open_page
        element = find('.btn-primary', text: '投稿')
        expect(element).to be_visible
        element.click
        fill_in 'post_lyrics', with: 'test lyrics'
        fill_in 'post_song_title', with: 'test title'
        fill_in 'post_artist', with: ''
        fill_in 'post_tags', with: 'test,tags'
        fill_in 'post_story', with: 'test story'
        fill_in 'link_to_music', with: 'test url'
        click_button '投稿'
        expect(page).to have_content 'アーティストを入力してください'
      end
    end
  end
  describe '投稿編集' do
    before { create_post }
    context 'フォームの入力値が正常' do
      it '投稿の編集が成功' do
        find('.card-side').click
        find('a.btn.btn-primary', text: '編集').click
        fill_in 'post_lyrics', with: 'test lyrics'
        fill_in 'post_song_title', with: 'test title'
        fill_in 'post_artist', with: 'test artist'
        fill_in 'post_tags', with: 'test,tags'
        fill_in 'post_story', with: 'test story'
        fill_in 'link_to_music', with: 'test url'
        click_button '投稿'
        expect(page).to have_content '投稿を更新しました'
        expect(current_path).to match(%r{^/posts/\d+$})
      end
    end

    context '歌詞未記入' do
      it '投稿の編集が失敗' do
        find('.card-side').click
        find('a.btn.btn-primary', text: '編集').click
        fill_in 'post_lyrics', with: ''
        fill_in 'post_song_title', with: 'test title'
        fill_in 'post_artist', with: 'test artist'
        fill_in 'post_tags', with: 'test,tags'
        fill_in 'post_story', with: 'test story'
        fill_in 'link_to_music', with: 'test url'
        click_button '投稿'
        expect(page).to have_content '歌詞を入力してください'
      end
    end

    context '曲名未記入' do
      it '投稿の編集が失敗' do
        find('.card-side').click
        find('a.btn.btn-primary', text: '編集').click
        fill_in 'post_lyrics', with: 'test lyrics'
        fill_in 'post_song_title', with: ''
        fill_in 'post_artist', with: 'test artist'
        fill_in 'post_tags', with: 'test,tags'
        fill_in 'post_story', with: 'test story'
        fill_in 'link_to_music', with: 'test url'
        click_button '投稿'
        expect(page).to have_content '曲名を入力してください'
      end
    end

    context 'アーティスト未記入' do
      it '投稿の編集が失敗' do
        find('.card-side').click
        find('a.btn.btn-primary', text: '編集').click
        fill_in 'post_lyrics', with: 'test lyrics'
        fill_in 'post_song_title', with: 'test title'
        fill_in 'post_artist', with: ''
        fill_in 'post_tags', with: 'test,tags'
        fill_in 'post_story', with: 'test story'
        fill_in 'link_to_music', with: 'test url'
        click_button '投稿'
        expect(page).to have_content 'アーティストを入力してください'
      end
    end
  end
end
