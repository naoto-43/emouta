require 'rails_helper'

RSpec.describe PostComment, type: :system do
  let(:user) { create(:user) }
  before { visit_show }

  describe 'コメント作成' do
    context 'フォームの入力値が正常' do
      it 'コメントの新規作成が成功' do
        save_and_open_page
        fill_in 'post_comment_comment', with: 'test comment'
        click_button '投稿'
        expect(page).to have_link('編集', href: %r{post_comments/\d+/edit})
      end
    end

    context 'コメント未記入' do
      it 'コメントの新規作成が失敗' do
        save_and_open_page
        fill_in 'post_comment_comment', with: ''
        click_button '投稿'
        expect(page).to have_no_link('編集', href: %r{post_comments/\d+/edit})
      end
    end
  end
  describe 'コメント編集' do
    before { create_comment }
    context 'フォームの入力値が正常' do
      it 'コメントの編集が成功' do
        click_link('編集', href: %r{post_comments/\d+/edit})
        within("turbo-frame[src*='post_comments'][src*='edit']") do
          fill_in 'post_comment_comment', with: 'edit comment'
          click_button '更新'
        end
        expect(page).to have_content 'edit comment'
      end
    end

    context 'コメント未記入' do
      it 'コメントの編集が失敗' do
        click_link('編集', href: %r{post_comments/\d+/edit})
        within("turbo-frame[src*='post_comments'][src*='edit']") do
          fill_in 'post_comment_comment', with: 'edit comment'
          click_button '更新'
        end
        expect(page).to have_content 'test comment'
      end
    end
  end
end
