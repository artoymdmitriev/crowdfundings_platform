class RemoveColumnsFromPayments < ActiveRecord::Migration[5.0]
  def change
    remove_column :payments, :first_name
    remove_column :payments, :last_name
    remove_column :payments, :success
    remove_column :payments, :authorization_code
    add_column :payments, :payment_id, :string
  end
end
