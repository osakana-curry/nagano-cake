class Cart < ApplicationRecord

 belongs_to :item
 belongs_to :customer

 validates :customer_id, :item_id, :amount, presence: true

 def subtotal
    item.add_tax_price * amount
 end

 def total
   item.add_tax_price * amount
 end

end
