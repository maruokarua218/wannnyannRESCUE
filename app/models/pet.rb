class Pet < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  validates :image, presence: true
  validates :gender, presence: true
  validates :animal_type, presence: true
  validates :prefectures_name, presence: true
  validates :content, presence: true
  mount_uploader :image, ImageUploader
  enum gender: { female: 1, male: 2, unknown: 3 }, _prefix: true
  enum prefectures_name: { hokkaido: 1, aomori: 2, iwate: 3, miyagi: 4, akita: 5, yamagata: 6, hukusima: 7,
        ibaraki: 8, tochigi: 9, gunma: 10, saitama: 11, tiba: 12, tokyo: 13, kanagawa: 14,
        niigata: 15, toyama: 16, isikawa: 17, hukui: 18, yamanashi: 19, nagano: 20,
        gihu: 21, sizuoka: 22, aichi: 23, mie: 24,
        siga: 25, kyoto: 26, oosaka: 27, hyougo: 28, nara: 29, wakayama: 30,
        tottori: 31, simane: 32, okayama: 33, hirosima: 34, yamaguti: 35,
        tokusima: 36, kagawa: 37, ehime: 38, kouchi: 39,
        hukuoka: 40, saga: 41, nagasaki: 42, kumamoto: 43, ooita: 44, miyagi: 45, kagosima:46,
        okinawa: 47 }
end
