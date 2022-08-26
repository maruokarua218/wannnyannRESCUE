require 'rails_helper'
RSpec.describe 'ペット管理機能', type: :system do

  describe 'ペットのCRUD機能のテスト' do
    let!(:user){ FactoryBot.create(:user) }
    let!(:second_user){ FactoryBot.create(:second_user)}
    let!(:pet){ FactoryBot.create(:pet, user: user)}

    context 'ペット登録画面で登録するボタンを押した場合' do
      it '登録できる' do
        visit new_session_path
        fill_in 'session_email', with: 'aa@gmail.com'
        fill_in 'session_password', with: 'aadayo'
        click_on 'ログインする'
        visit new_pet_path
        attach_file "pet[image]", File.join(Rails.root, 'spec/factories/images/1.jpg.webp')
        find("#pet_gender").find("option[value='female']").select_option
        fill_in "pet_animal_type", with: '柴犬'
        find("#pet_prefectures_name").find("option[value='hokkaido']").select_option
        fill_in "pet_content", with: 'おとなしい性格です'
        click_on '登録する'
        expect(page).to have_content 'ペットを投稿しました！'
      end
    end
    context 'ペット一覧画面で編集ボタンを押した場合' do
      it '編集できる' do
        visit new_session_path
        fill_in 'session_email', with: 'aa@gmail.com'
        fill_in 'session_password', with: 'aadayo'
        click_on 'ログインする'
        visit pets_path
        all('tbody tr')[0].click_link '編集'
        find("#pet_gender").find("option[value='male']").select_option
        click_on '更新する'
        expect(page).to have_content 'ペット情報を更新しました！'
      end
    end
    context 'ペット一覧画面で削除ボタンを押した場合' do
      it '削除できる' do
        visit new_session_path
        fill_in 'session_email', with: 'aa@gmail.com'
        fill_in 'session_password', with: 'aadayo'
        click_on 'ログインする'
        visit pets_path
        all('tbody tr')[0].click_link '削除'
        expect(page.accept_confirm).to eq "Are you sure?"
        expect(page).to have_content '投稿を削除しました！'
      end
    end
  end
  describe '詳細表示機能' do
    let!(:user){ FactoryBot.create(:user) }
    let!(:second_user){ FactoryBot.create(:second_user)}
    let!(:pet){ FactoryBot.create(:pet, user: user)}
    context '種類でキーワード検索をした場合' do
      it "種類に完全一致するペットが絞り込まれる" do
        visit pets_path
        fill_in 'q_animal_type_cont', with: '柴犬'
        click_on "検索"
        expect(page).to have_content '柴犬'
      end
    end
    context '性別でキーワード検索をした場合' do
      it "性別に完全一致するペットが絞り込まれる" do
        visit pets_path
        find("#q_gender_eq").find("option[value='1']").select_option
        click_on "検索"
        expect(page).to have_content '女の子'
      end
    end
    context '都道府県でキーワード検索をした場合' do
      it "都道府県に完全一致するペットが絞り込まれる" do
        visit pets_path
        find("#q_prefectures_name_eq").find("option[value='1']").select_option
        click_on "検索"
        expect(page).to have_content '北海道'
      end
    end
  end
end
