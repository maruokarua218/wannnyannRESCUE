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
  # enum prefectures_name:{      北海道:1,青森県:2,岩手県:3,宮城県:4,秋田県:5,山形県:6,福島県:7,
  #    茨城県:8,栃木県:9,群馬県:10,埼玉県:11,千葉県:12,東京都:13,神奈川県:14,
  #    新潟県:15,富山県:16,石川県:17,福井県:18,山梨県:19,長野県:20,
  #    岐阜県:21,静岡県:22,愛知県:23,三重県:24,
  #    滋賀県:25,京都府:26,大阪府:27,兵庫県:28,奈良県:29,和歌山県:30,
  #    鳥取県:31,島根県:32,岡山県:33,広島県:34,山口県:35,
  #    徳島県:36,香川県:37,愛媛県:38,高知県:39,
  #    福岡県:40,佐賀県:41,長崎県:42,熊本県:43,大分県:44,宮崎県:45,鹿児島県:46,
  #    沖縄県:47 }
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
