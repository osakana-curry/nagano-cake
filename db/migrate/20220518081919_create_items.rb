class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name,         null: false
      t.text :text,           null: false
      t.integer :price,       null: false
      t.boolean :sale_status, null: false, default: true

      t.timestamps
    end
  end
end
