class Item < ApplicationRecord

  has_one_attached :image

  belongs_to :genre

  enum sale_status: { "販売中": 0, "販売停止中": 1 }

  def get_image
    (profile_image.attached?) ? profile_image : 'no_image.jpg'
  end

end
