class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :address

  attr_accessor :token
  validates :price, presence: true
  validates :token, presence: true
end