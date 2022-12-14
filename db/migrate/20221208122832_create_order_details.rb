class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      
      t.integer :order_id
      t.integer :item_id
      t.integer :amount
      t.integer :making_status, default: 0, null: false
      t.integer :prices

      t.timestamps
    end
  end
end
