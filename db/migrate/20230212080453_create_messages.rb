class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.integer :customer_id
      t.integer :room_id
      t.string :message

      t.timestamps
    end
  end
end
