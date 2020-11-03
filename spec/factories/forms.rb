FactoryBot.define do
  factory :form do
    Faker::Config.locale = :ja
    postal_code           {Faker::Address.postcode}
    area_id               {Faker::Number.between(from: 2, to: 48)}
    city                  {Faker::Address.city}
    address               {Faker::Address.full_address}
    building              {Faker::Name.name}
    phone_number          {"08066660000"}
    token {"tok_abcdefghijk00000000000000000"}
    user_id {1}
    item_id {1}
  end
end