# spec/factories/orders.rb

FactoryBot.define do
  factory :order do
    price { 1000 } # priceのデフォルト値を設定
  end
end
