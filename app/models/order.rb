class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details #中間テーブル
  has_many :items, through: :order_details  #注文には商品が多くある

  enum pay_type:{
      クレジットカード: 0,
      銀行振込: 1
  }

  enum order_status:{
      入金待ち: 0,
      入金確認: 1,
      製作中: 2,
      発送準備中: 3,
      発送済み: 4
  }

  def full_name
    self.customer.last_name + self.customer.first_name
  end

end
