class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  belongs_to :address
  
  attr_accessor :token
  validates :price, presence: true
end