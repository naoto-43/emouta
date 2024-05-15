require 'rails_helper'

RSpec.describe "UserLogin", type: :system do
  let(:user) { create(:user) }

  describe '未登録' do
    describe 'ユーザー新規登録' do
      context 'フォームの入力値が正常' do
        it 'ユーザーの新規作成が成功' do
          visit new_user_registration_path
          fill_in 'user_name', with: 'test'
          fill_in 'user_email', with: 'test@example.com'
          fill_in 'user_password', with: 'password'
          fill_in 'user_password_confirmation', with: 'password'
          click_button 'アカウント登録'
          expect(page).to have_content 'ようこそ！正常にサインアップしました。'
          expect(current_path).to eq root_path
        end
      end

      context '名前未記入' do
        it 'ユーザーの新規作成が失敗' do
          visit new_user_registration_path
          fill_in 'user_name', with: ''
          fill_in 'user_email', with: 'test@example.com'
          fill_in 'user_password', with: 'password'
          fill_in 'user_password_confirmation', with: 'password'
          click_button 'アカウント登録'
          expect(page).to have_content "ニックネームを入力してください"
        end
      end

      context 'メールアドレス未記入' do
        it 'ユーザーの新規作成が失敗' do
          visit new_user_registration_path
          fill_in 'user_name', with: 'test'
          fill_in 'user_email', with: ''
          fill_in 'user_password', with: 'password'
          fill_in 'user_password_confirmation', with: 'password'
          click_button 'アカウント登録'
          expect(page).to have_content "メールアドレスを入力してください"
        end
      end

      context 'パスワード未記入' do
        it 'ユーザーの新規作成が失敗する' do
          visit new_user_registration_path
          fill_in 'user_name', with: 'test'
          fill_in 'user_email', with: 'test@example.com'
          fill_in 'user_password', with: ''
          fill_in 'user_password_confirmation', with: 'password'
          click_button 'アカウント登録'
          expect(page).to have_content "パスワードを入力してください"
        end
      end

      context 'パスワード確認未記入' do
        it 'ユーザーの新規作成が失敗する' do
          visit new_user_registration_path
          fill_in 'user_name', with: 'test'
          fill_in 'user_email', with: 'test@example.com'
          fill_in 'user_password', with: 'password'
          fill_in 'user_password_confirmation', with: ''
          click_button 'アカウント登録'
          expect(page).to have_content "パスワード確認とパスワードの入力が一致しません"
        end
      end

      context '登録済メールアドレス' do
        it 'ユーザーの新規作成が失敗する' do
          visit new_user_registration_path
          fill_in 'user_name', with: 'test'
          fill_in 'user_email', with: user.email
          fill_in 'user_password', with: 'password'
          fill_in 'user_password_confirmation', with: 'password'
          click_button 'アカウント登録'
          expect(page).to have_content "メールアドレスはすでに存在します"
        end
      end

      context 'パスワードの長さ不足' do
        it 'ユーザーの新規作成が失敗する' do
          visit new_user_registration_path
          fill_in 'user_name', with: 'test'
          fill_in 'user_email', with: 'test@example.com'
          fill_in 'user_password', with: 'pw'
          fill_in 'user_password_confirmation', with: 'pw'
          click_button 'アカウント登録'
          expect(page).to have_content "パスワードは6文字以上で入力してください"
        end
      end

      context 'パスワードとパスワード確認の不一致' do
        it 'ユーザーの新規作成が失敗する' do
          visit new_user_registration_path
          fill_in 'user_name', with: 'test'
          fill_in 'user_email', with: 'test@example.com'
          fill_in 'user_password', with: 'password'
          fill_in 'user_password_confirmation', with: 'different'
          click_button 'アカウント登録'
          expect(page).to have_content "パスワード確認とパスワードの入力が一致しません"
        end
      end
    end
  end
  describe '登録済' do
    describe 'ログイン' do
      context 'フォームの入力値が正常' do
        it 'ログイン成功' do
          visit new_user_session_path
          fill_in 'user_email', with: user.email
          fill_in 'user_password', with: 'password'
          click_button 'ログイン'
          expect(page).to have_content '正常にサインインしました。'
          expect(current_path).to eq root_path
        end
      end

      context 'メールアドレス未入力' do
        it 'ログイン失敗' do
          visit new_user_session_path
          fill_in 'user_email', with: ''
          fill_in 'user_password', with: 'password'
          click_button 'ログイン'
          expect(page).to have_content "無効なメールアドレスまたはパスワードです。"
        end
      end

      context 'パスワード未入力' do
        it 'ログイン失敗' do
          visit new_user_session_path
          fill_in 'user_email', with: user.email
          fill_in 'user_password', with: ''
          click_button 'ログイン'
          expect(page).to have_content "無効なメールアドレスまたはパスワードです。"
        end
      end

      context 'メールアドレスが異なる' do
        it 'ログイン失敗' do
          visit new_user_session_path
          fill_in 'user_email', with: 'test@example.com'
          fill_in 'user_password', with: 'password'
          click_button 'ログイン'
          expect(page).to have_content "無効なメールアドレスまたはパスワードです。"
        end
      end

      context 'パスワードが異なる' do
        it 'ログイン失敗' do
          visit new_user_session_path
          fill_in 'user_email', with: user.email
          fill_in 'user_password', with: 'different'
          click_button 'ログイン'
          expect(page).to have_content "無効なメールアドレスまたはパスワードです。"
        end
      end
    end
  end
end
