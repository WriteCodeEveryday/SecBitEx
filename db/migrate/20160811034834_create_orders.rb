class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :satoshis
      t.integer :order_id
      t.integer :address_id
      t.string :status
      t.string :order_type
      t.boolean :notified

      t.timestamps
    end
  end
end
