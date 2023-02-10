class AddCustomerIdToRecruit < ActiveRecord::Migration[6.1]
  def change
    add_column :recruits, :customer_id, :integer
  end
end
