FactoryBot.define do
  factory :user do
    japanese_user = Gimei.name
    nick_name             {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              { '1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation { password }
    birth_day             {Faker::Date.birthday(min_age: 18, max_age: 65)}
    first_name            { japanese_user.first.kanji }
    first_name_kana       { japanese_user.first.katakana }
    last_name             { japanese_user.last.kanji }
    last_name_kana        { japanese_user.last.katakana }
  end
end