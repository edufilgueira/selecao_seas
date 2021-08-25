class AddDataInicioRecursoToConfiguracaos < ActiveRecord::Migration[5.2]
  def change
    add_column :configuracaos, :data_inicio_recurso, :date
  end
end
