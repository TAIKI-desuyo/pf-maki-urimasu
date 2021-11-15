class CreateBookMarks < ActiveRecord::Migration[5.2]
  def change
    create_table :book_marks do |t|
      t.references :user, foreign_key: true, null: false
      t.references :makii, foreign_key: true, null: false

      t.timestamps
    end
  end
end
