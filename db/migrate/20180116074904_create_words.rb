class CreateWords < ActiveRecord::Migration[5.1]
  def change
    create_table :words do |t|
      t.string :spelling
      t.integer :unit_id
      t.string :meaning
      t.string :word_type
      t.string :sentence
      t.string :synonym
      t.integer :mistake

      t.timestamps
    end
  end
end
