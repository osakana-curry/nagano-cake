class Item < ApplicationRecord

  has_one_attached :image
  
  

  def get_image
    (profile_image.attached?) ? profile_image : 'no_image.jpg'
  end

end
