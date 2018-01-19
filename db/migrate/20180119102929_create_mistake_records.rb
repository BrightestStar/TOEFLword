class CreateMistakeRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :mistake_records do |t|
      t.integer :user_id
      t.integer :word_id

      t.timestamps
    end
  end
end
