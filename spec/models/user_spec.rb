require 'rails_helper'
describe '新規登録機能', type: :model do
  describe 'バリデーションのテスト' do
    context '名前が空の場合' do
      it 'バリデーションにひっかる' do
        user = FactoryBot.build(:user, name: '')
        expect(user).not_to be_valid
      end
    end
    context 'メールアドレスが空の場合' do
      it 'バリデーションにひっかる' do
        user = FactoryBot.build(:user, email: '')
        expect(user).not_to be_valid
      end
    end
    context 'パスワードが空の場合' do
      it 'バリデーションにひっかる' do
        user = FactoryBot.build(:user, password_confirmation: '')
        expect(user).not_to be_valid
      end
    end
    context '名前とメールアドレスとパスワードに内容が記載されている場合' do
      it 'バリデーションが通る' do
        user = FactoryBot.build(:user)
        expect(user).to be_valid
      end
    end
  end
end
