class AddIndexToMistakeRecords < ActiveRecord::Migration[5.1]
  def change
    add_index :mistake_records, :user_id
    add_index :mistake_records, :word_id
  end
end
