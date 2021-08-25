class AddDeletedAtToCargos < ActiveRecord::Migration[5.2]
  def change
    add_column :cargos, :deleted_at, :datetime
    add_index :cargos, :deleted_at
  end
end