module CreatePostModule
  def create_post()
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
  end
end
