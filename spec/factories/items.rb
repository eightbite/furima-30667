FactoryBot.define do
  factory :item do

    Faker::Config.locale = :ja
    name                  {Faker::Lorem.sentence}
    exposition            {Faker::Lorem.sentence}
    category_id           {Faker::Number.between(from: 2, to: 11)}
    status_id             {Faker::Number.between(from: 2, to: 7)}
    burden_id             {Faker::Number.between(from: 2, to: 3)}
    area_id               {Faker::Number.between(from: 2, to: 48)}
    day_id                {Faker::Number.between(from: 2, to: 4)}
    price                 {Faker::Number.between(from: 300, to: 9999999)}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/花譜.jpeg'), filename: '花譜.jpeg')
    end
  end
end
