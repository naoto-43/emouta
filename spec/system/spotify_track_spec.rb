require 'rails_helper'

RSpec.describe 'SpotifyTracks', type: :system do
  describe '楽曲紹介' do
    context 'フォームの入力値が正常' do
      it '楽曲紹介が成功' do
        visit '/spotify_tracks/new'
        save_and_open_page
        fill_in 'track_query_0', with: 'artist'
        find('#tracks_0 button', match: :first).click
        click_button '検索'
        expect(page).to have_selector('iframe', count: 10)
        expect(current_path).to eq '/spotify_tracks/result'
      end
    end

    context 'フォーム未記入' do
      it '楽曲紹介が失敗' do
        visit '/spotify_tracks/new'
        save_and_open_page
        fill_in 'track_query_0', with: ''
        click_button '検索'
        expect(page).to have_content 'アーティストが見つかりませんでした。楽曲候補から選択して、もう一度検索してください。'
      end
    end

    context 'フォーム不正' do
      it '楽曲紹介が失敗' do
        visit '/spotify_tracks/new'
        save_and_open_page
        fill_in 'track_query_0', with: 'artist'
        click_button '検索'
        expect(page).to have_content 'アーティストが見つかりませんでした。楽曲候補から選択して、もう一度検索してください。'
      end
    end
  end
end
