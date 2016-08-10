class CreateStripeInfos < ActiveRecord::Migration[5.0]
  def change
    create_table :stripe_infos do |t|
    	t.integer :user_id
      t.string :publishable_key
      t.string :secret_key

      t.timestamps
    end
  end
end
