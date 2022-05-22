class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|

      t.integer :customer_id
      t.string :postcode, null: false
      t.string :name, null: false
      t.string :address, null: false
      t.integer :delivery_fee, null: false
      t.integer :charge, null: false
      t.integer :pay_type, null: false, default:0
      t.integer :order_status, null: false, default:0
      t.timestamps
    end
  end
end
