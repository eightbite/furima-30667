FactoryBot.define do
  factory :user do

    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {"000aaa"}
    password_confirmation {password}
    Faker::Config.locale = :ja
    family_name           {Faker::Name.last_name}
    first_name            {Faker::Name.first_name}
    family_name_kana      {"ゼン"}
    first_name_kana       {"カク"}
    birthday              {Faker::Date.between(from: '1930-1-1', to: '2015-12-31')}
  end
end