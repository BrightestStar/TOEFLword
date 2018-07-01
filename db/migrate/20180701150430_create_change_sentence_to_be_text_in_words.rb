class CreateChangeSentenceToBeTextInWords < ActiveRecord::Migration[5.1]
  def change
    change_column :words, :sentence, :text
  end
end
