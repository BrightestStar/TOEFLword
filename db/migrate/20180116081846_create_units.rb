class CreateUnits < ActiveRecord::Migration[5.1]
  def change
    create_table :units do |t|
      t.integer :unit_number

      t.timestamps
    end
  end
end
