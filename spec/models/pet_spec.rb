require 'rails_helper'
describe 'ペットモデル機能', type: :model do
  describe 'バリデーションのテスト' do
    context 'ペットの写真が空の場合' do
      it 'バリデーションにひっかる' do
        pet = FactoryBot.build(:pet, image: '')
        expect(pet).not_to be_valid
      end
    end
    context 'ペットの種類が空の場合' do
      it 'バリデーションにひっかる' do
        pet = FactoryBot.build(:pet, animal_type: '')
        expect(pet).not_to be_valid
      end
    end
    context 'ペットの内容が空の場合' do
      it 'バリデーションにひっかる' do
        pet = FactoryBot.build(:pet, content: '')
        expect(pet).not_to be_valid
      end
    end
    context 'ペットの写真と性別と種類と都道府県と内容に内容が記載されている場合' do
      it 'バリデーションが通る' do
        pet = FactoryBot.build(:pet)
        expect(pet).to be_valid
      end
    end
  end
end
