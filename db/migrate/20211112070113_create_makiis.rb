class CreateMakiis < ActiveRecord::Migration[5.2]
  def change
    create_table :makiis do |t|
      t.text :address
      t.integer :cost
      t.string :amount
      t.text :body
      t.boolean :is_active
      t.integer :user_id
      t.string :image_id
      t.float :rate, null: false, default: 0
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end
end
