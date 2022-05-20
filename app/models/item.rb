class Item < ApplicationRecord

  has_one_attached :image

  belongs_to :genre

  enum sale_status: { "販売中": 0, "販売停止中": 1 }

  def add_tax_price
    (self.price * 1.10).round
  end

  def get_image
    (image.attached?) ? image : 'no_image.jpg'
  end

end
