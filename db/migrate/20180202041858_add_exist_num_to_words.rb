class AddExistNumToWords < ActiveRecord::Migration[5.1]
  def change
    add_column :words, :exist_num, :integer, default: 1
  end
end
