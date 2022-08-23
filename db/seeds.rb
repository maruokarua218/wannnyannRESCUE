# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

qq = User.create(name: 'qq', email: 'qq@gmail.com', password: 'qqdayo', client: false, admin: false )
User.create(name: 'aa', email: 'aa@gmail.com', password: 'aadayo', client: false, admin: true )
ee = User.create(name: 'ee', email: 'ee@gmail.com', password: 'eedayo', client: false, admin: false )
User.create(name: 'rr', email: 'rr@gmail.com', password: 'rrdayo', client: true, admin: false )
tt = User.create(name: 'tt', email: 'tt@gmail.com', password: 'ttdayo', client: false, admin: false )
User.create(name: 'yy', email: 'yy@gmail.com', password: 'yydayo', client: true, admin: false )
uu = User.create(name: 'uu', email: 'uu@gmail.com', password: 'uudayo', client: false, admin: false )
User.create(name: 'ii', email: 'ii@gmail.com', password: 'iidayo', client: true, admin: false )
oo = User.create(name: 'oo', email: 'oo@gmail.com', password: 'oodayo', client: false, admin: false )
User.create(name: 'pp', email: 'pp@gmail.com', password: 'ppdayo', client: true, admin: false )

Pet.create(user: qq, image: File.open("./app/assets/images/dog1.jpg"), gender: 'female', animal_type: 'トイプードル', prefectures_name: 'tokyo', content: '活発でとても元気な子です。ボール遊びが大好きです。')
Pet.create(user: qq, image: File.open("./app/assets/images/cat1.jpg"), gender: 'female', animal_type: 'スノーシュー', prefectures_name: 'tokyo', content: 'とってもおっとりとした性格です。人懐っこいです。')
Pet.create(user: ee, image: File.open("./app/assets/images/dog2.jpg"), gender: 'male', animal_type: 'パグ', prefectures_name: 'isikawa', content: '活発的でとても元気です。お散歩が大好きです。')
Pet.create(user: tt, image: File.open("./app/assets/images/dog3.jpg"), gender: 'male', animal_type: '柴犬', prefectures_name: 'hokkaido', content: '大人しく、優しい性格です。')
Pet.create(user: tt, image: File.open("./app/assets/images/cat2.jpg"), gender: 'female', animal_type: 'ロシアンブルー', prefectures_name: 'hokkaido', content: 'とても綺麗な目がチャームポイントです。少し警戒心が強いです。')
Pet.create(user: uu, image: File.open("./app/assets/images/dog4.jpg"), gender: 'male', animal_type: '柴犬', prefectures_name: 'saitama', content: '人懐っこいです。お散歩が大好きです。')
Pet.create(user: oo, image: File.open("./app/assets/images/dog5.jpg"), gender: 'unknown', animal_type: 'トイプードル', prefectures_name: 'tokyo', content: '人懐っこい、寝るのが大好きです。')
