class CreateRecruitComments < ActiveRecord::Migration[6.1]
  def change
    create_table :recruit_comments do |t|
      t.text :comment
      t.integer :customer_id
      t.integer :recruit_id
      t.timestamps
    end
  end
end
