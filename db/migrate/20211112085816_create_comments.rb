class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :comment
      t.integer :makii_id
      t.integer :user_id
      t.integer :reply_comment
      t.timestamps
    end
  end
end
