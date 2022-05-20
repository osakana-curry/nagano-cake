class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|

      t.integer :customer_id
      t.string :postcode
      t.string :name
      t.string :address
      t.integer :delivery_fee
      t.integer :charge
      t.integer :pay_type
      t.integer :order_status
      t.timestamps
    end
  end
end
