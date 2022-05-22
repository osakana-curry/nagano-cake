class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details #中間テーブル
  has_many :items, through: :order_details  #注文には商品が多くある

  enum pay_type:{
      クレジットカード: 0,
      銀行振込: 1
  }
end
