# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

丸岡 = User.create(name: '丸岡', email: 'maruoka@gmail.com', password: 'maruokadayo', client: false, admin: false )
User.create(name: '遠藤', email: 'enndou@gmail.com', password: 'enndoudayo', client: false, admin: true )
山田 = User.create(name: '山田', email: 'yamada@gmail.com', password: 'yamadadayo', client: false, admin: false )
User.create(name: '吉田', email: 'yosida@gmail.com', password: 'yosidadayo', client: true, admin: false )
金子 = User.create(name: '金子', email: 'kaneko@gmail.com', password: 'kanekodayo', client: false, admin: false )
User.create(name: '佐藤', email: 'satou@gmail.com', password: 'satoudayo', client: true, admin: false )
齋藤 = User.create(name: '齋藤', email: 'saitou@gmail.com', password: 'saitoudayo', client: false, admin: false )
User.create(name: '中村', email: 'nakamura@gmail.com', password: 'nakamuradayo', client: true, admin: false )
森塚 = User.create(name: '森塚', email: 'morituka@gmail.com', password: 'moritukadayo', client: false, admin: false )
User.create(name: '門脇', email: 'kadowaki@gmail.com', password: 'kadowakidayo', client: true, admin: false )

Pet.create(user: 丸岡, image: File.open("./app/assets/images/dog1.jpg"), gender: 'female', animal_type: 'トイプードル', prefectures_name: 'tokyo', content: '活発でとても元気な子です。ボール遊びが大好きです。')
Pet.create(user: 丸岡, image: File.open("./app/assets/images/cat1.jpg"), gender: 'female', animal_type: 'スノーシュー', prefectures_name: 'tokyo', content: 'とってもおっとりとした性格です。人懐っこいです。')
Pet.create(user: 山田, image: File.open("./app/assets/images/dog2.jpg"), gender: 'male', animal_type: 'パグ', prefectures_name: 'isikawa', content: '活発的でとても元気です。お散歩が大好きです。')
Pet.create(user: 金子, image: File.open("./app/assets/images/dog3.jpg"), gender: 'male', animal_type: '柴犬', prefectures_name: 'hokkaido', content: '大人しく、優しい性格です。')
Pet.create(user: 金子, image: File.open("./app/assets/images/cat2.jpg"), gender: 'female', animal_type: 'ロシアンブルー', prefectures_name: 'hokkaido', content: 'とても綺麗な目がチャームポイントです。少し警戒心が強いです。')
Pet.create(user: 齋藤, image: File.open("./app/assets/images/dog4.jpg"), gender: 'male', animal_type: '柴犬', prefectures_name: 'saitama', content: '人懐っこいです。お散歩が大好きです。')
Pet.create(user: 森塚, image: File.open("./app/assets/images/dog5.jpg"), gender: 'unknown', animal_type: 'トイプードル', prefectures_name: 'tokyo', content: '人懐っこい、寝るのが大好きです。')

Conversation.create(sender_id: 9, recipient_id: 10)
Conversation.find(1).messages.create(user_id: 10, conversation_id: 1, body:"こんにちは！")
Conversation.find(1).messages.create(user_id: 9, conversation_id: 1, body:"こんにちは、初めまして！")
Conversation.find(1).messages.create(user_id: 10, conversation_id: 1, body:"ワンちゃんはどのくらいの大きさですか？")
Conversation.find(1).messages.create(user_id: 9, conversation_id: 1, body:"60cm体重は5kgです！")
Conversation.find(1).messages.create(user_id: 10, conversation_id: 1, body:"教えていただき有難うございます！")

5.times do |n|
  follower_id = "1"
  if n == 0
    followed_id = "7"
  else
    followed_id = "#{n + 1}"
  end
  Relationship.create(followed_id: followed_id, follower_id: follower_id)
end

5.times do |n|
  User.all.ids.each do |user_id|
    Favorite.create(user_id: user_id, pet_id: rand(1..5))
  end
end
