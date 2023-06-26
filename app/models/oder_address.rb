class OrderAddress
  include ActiveModel::Model
  attr_accessor :price, :post_number, :area, :city_name, :banchi, :build_name, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :user_id
    validates :postal_number, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end
  validates :prefecture, numericality: {other_than: 0, message: "can't be blank"}

  def save
    # 寄付情報を保存し、変数donationに代入する
    order = Order.create(price: price, user_id: user_id, item_id: item_id)
    # 住所を保存する
    # donation_idには、変数donationのidと指定する
    Address.create(post_number: post_number, area: area, city_name: city_name, banchi: banchi, build_name: build_name, phone_number: phone_number, user_id: user_id, item_id: item_id)
  end
end