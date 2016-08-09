class AddTwoFactorToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :two_fac_code, :string
  end
end
