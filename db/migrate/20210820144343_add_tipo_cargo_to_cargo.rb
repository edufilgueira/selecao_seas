class AddTipoCargoToCargo < ActiveRecord::Migration[5.2]
  def change
    add_column :cargos, :tipo_cargo, :text
  end
end
