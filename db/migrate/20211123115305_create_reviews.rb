class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :makii_id
      t.float :rate, default: 0.0, null: false

      t.timestamps
    end
  end
end
