class AddInputStatusToUnits < ActiveRecord::Migration[5.1]
  def change
    add_column :units, :input_status, :string
  end
end
