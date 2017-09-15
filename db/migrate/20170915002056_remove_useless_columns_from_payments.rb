class RemoveUselessColumnsFromPayments < ActiveRecord::Migration[5.0]
  def change
    remove_column :payments, :last4
    remove_column :payments, :payment_id
  end
end
