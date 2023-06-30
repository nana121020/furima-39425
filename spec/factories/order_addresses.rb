FactoryBot.define do
  factory :order_address do
    token {"tok_abcdefghijk00000000000000000"}
    post_number { '123-4567' }
    prefecture_id { 1 }
    city_name { '東京都' }
    banchi { '1-1' }
    build_name { '北' }
    phone_number { '090_1111-1111' }
  end
end
