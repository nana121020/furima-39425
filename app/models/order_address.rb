class OrderAddress
  include ActiveModel::Model
  attr_accessor :price, :post_number, :prefecture_id, :city_name, :banchi, :build_name, :phone_number, :user_id, :item_id, :token
  validates :token, presence: true

  with_options presence: true do
    validates :user_id
    validates :post_number, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city_name
    validates :banchi
    validates :phone_number
    validates :item_id
  end
  validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_number: post_number, prefecture_id: prefecture_id, city_name: city_name, banchi: banchi, build_name: build_name, phone_number: phone_number, order_id: order.id)
  end
end