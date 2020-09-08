FactoryBot.define do
  factory :item do
    name { Faker::Dessert.variety }
    description              { Faker::Quote.famous_last_words }
    category_id              { Faker::Number.between(from: 1, to: 10) }
    status_id { Faker::Number.between(from: 1, to: 6) }
    shipping_charges_id { Faker::Number.between(from: 1, to: 2) }
    address_id { Faker::Number.between(from: 1, to: 47) }
    date_takes_id { Faker::Number.between(from: 1, to: 3) }
    price { Faker::Number.between(from: 300, to: 99_999) }
  end
end
