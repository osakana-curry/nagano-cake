class Cart < ApplicationRecord

 belongs_to :item
 belongs_to :customer

 def subtotal
    item.add_tax_price * amount
 end

 def total
   item.add_tax_price * amount
 end

 validates :amount, presence: true

end
