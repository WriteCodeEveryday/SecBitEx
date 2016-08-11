class CreateOrderAdditionals < ActiveRecord::Migration[5.0]
  def change
    create_table :order_additionals do |t|
      t.integer :order_id
      t.string :key
      t.string :value

      t.timestamps
    end
  end
end
