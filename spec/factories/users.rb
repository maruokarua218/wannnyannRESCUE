FactoryBot.define do
  factory :user do
    name { 'aa' }
    email { 'aa@gmail.com' }
    password { 'aadayo' }
    password_confirmation { 'aadayo' }
    client { false }
    admin { true }
  end
  factory :second_user, class: User do
    name { 'rr' }
    email { 'rr@gmail.com' }
    password { 'rrdayo' }
    password_confirmation { 'rrdayo' }
    client { true }
    admin { false }
  end
end
