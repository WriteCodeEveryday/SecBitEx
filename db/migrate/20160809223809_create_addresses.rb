class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.integer :user_id
      t.string :public_key

      t.timestamps
    end
  end
end
