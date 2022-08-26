FactoryBot.define do
  factory :pet do
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/factories/images/1.jpg.webp'))}
    gender { 'female' }
    animal_type { '柴犬' }
    prefectures_name { 'hokkaido' }
    content {'おとなしい性格です'}
  end
end
