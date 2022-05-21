class Address < ApplicationRecord
  belongs_to :customer

  def address_all
  '〒' + self.postcode + ' ' + self.address + ' ' + self.name
  end
end
