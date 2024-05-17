module CreateCommentModule
  def create_comment()
    save_and_open_page
    fill_in 'post_comment_comment', with: 'test comment'
    click_button '投稿'
  end
end
