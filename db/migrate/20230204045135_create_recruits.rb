class CreateRecruits < ActiveRecord::Migration[6.1]
  def change
    create_table :recruits do |t|
      t.string :name, null: false
      t.string :school_name, null: false
      t.text :recruit_text, null: false
      t.integer :genre_id, null: false
      t.integer :city_id, null: false
      t.integer :customer_id, null: false
      t.timestamps
    end
  end
end
