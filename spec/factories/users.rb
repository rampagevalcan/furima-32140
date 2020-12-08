FactoryBot.define do
  factory :user do
    nickname { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    password { 'aaaa11' }
    password_confirmation { 'aaaa11' }
    family_name { '田中' }
    first_name { '太郎' }
    family_name_kana { 'タナカ' }
    first_name_kana { 'タロウ' }
    birthday { '2000-1-1' }
  end
end
