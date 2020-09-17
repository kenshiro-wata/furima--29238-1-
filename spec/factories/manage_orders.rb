FactoryBot.define do
  factory :manage_order do
    transient do
      address { Gimei.address }
    end
    token {Faker::Alphanumeric.alphanumeric(number: 15)}
    postal_code {'111-1111'}
    prefecture { Faker::Number.between(from: 1, to: 47)}
    address_city { address.city.kanji }
    block_number { address.town.kanji }
    building_number { address.town.hiragana}
    phone_number { Faker::Number.leading_zero_number(digits: 11)}
  end
end
