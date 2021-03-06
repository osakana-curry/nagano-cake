class Item < ApplicationRecord

  validates :name, presence: true
  validates :text, presence: true
  belongs_to :genre
  validates :price, presence: true

  has_one_attached :image
  has_many :carts#中間テーブル
  has_many :order_details#中間テーブル
  has_many :orders, through: :order_details


  enum sale_status: { "販売中": 0, "販売停止中": 1 }

  def add_tax_price
    (self.price * 1.10).round
  end

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image1.png')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

end
