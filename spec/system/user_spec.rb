require 'rails_helper'
RSpec.describe 'ユーザー登録・セッション機能・管理画面のテスト・メッセージ機能', type: :system do
  describe 'ユーザー登録のテスト' do
    context 'ユーザーが登録がなく、ログインしていない場合' do
      it 'ユーザーが新規登録をすれば、ログイン画面に移動する' do
        visit new_user_path
        fill_in 'user_name', with: 'aa'
        fill_in 'user_email', with: 'aa@gmail.com'
        fill_in 'user_password', with: 'aadayo'
        fill_in 'user_password_confirmation', with: 'aadayo'
        select '犬・猫を譲りたい'
        click_on 'アカウントを作成'
        expect(current_path).to eq new_session_path
      end
    end
    context 'ユーザーがログインせずにユーザー一覧へ飛んだとき' do
      it '​ログイン画面に遷移する​' do
        visit users_path
        expect(current_path).to eq new_session_path
      end
    end
    context 'ユーザーがログインせずにペット一覧にアクセスした時' do
      it 'ペットの一覧画面が正しく表示すること' do
        visit pets_path
        expect(current_path).to eq pets_path
      end
    end
  end
  describe 'セッション機能のテスト' do
    before do
      @user = FactoryBot.create(:user)
      @second_user = FactoryBot.create(:second_user)
    end
    context 'アカウント登録済みのユーザがログインしようとした場合' do
      it 'ログインできる' do
        visit new_session_path
        fill_in 'session_email', with: 'aa@gmail.com'
        fill_in 'session_password', with: 'aadayo'
        click_on 'ログインする'
        expect(current_path).to eq root_path
      end
      it 'ログアウトができる' do
        visit new_session_path
        fill_in 'session_email', with: 'aa@gmail.com'
        fill_in 'session_password', with: 'aadayo'
        click_on 'ログインする'
        click_on 'ログアウト'
        expect(page).to have_content 'ログアウトしました'
      end
    end
  end
  describe '管理画面のテスト' do
    before do
      @second_user = FactoryBot.create(:second_user)
      @user = FactoryBot.create(:user)
    end
    context '管理ユーザーが管理画面にアクセスしようとするとき' do
      it '管理画面にアクセスできる' do
        visit new_session_path
        fill_in 'session_email', with: 'aa@gmail.com'
        fill_in 'session_password', with: 'aadayo'
        click_on 'ログインする'
        visit admin_users_path
        expect(current_path).to eq admin_users_path
      end
    end
    context '一般ユーザーが管理画面にアクセスしようとするとき' do
      it '自分のタスクを表示させる' do
        visit new_session_path
        fill_in 'session_email', with: 'rr@gmail.com'
        fill_in 'session_password', with: 'rrdayo'
        click_on 'ログインする'
        visit admin_users_path
        expect(current_path).to eq pets_path
      end
    end
  end
  describe 'メッセージ機能のテスト' do
    before do
      @second_user = FactoryBot.create(:second_user)
      @user = FactoryBot.create(:user)
    end
    context 'ログインしてメッセージを押した場合' do
      it '自分の名前とメールアドレスを表示させる' do
        visit new_session_path
        fill_in 'session_email', with: 'aa@gmail.com'
        fill_in 'session_password', with: 'aadayo'
        click_on 'ログインする'
        click_on 'メッセージ'
        expect(page).to have_content 'aa'
        expect(page).to have_content 'aa@gmail.com'
      end
    end
  end
end
