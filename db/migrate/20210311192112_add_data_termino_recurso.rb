class AddDataTerminoRecurso < ActiveRecord::Migration[5.2]
  def change
    add_column :configuracaos, :data_termino_recurso, :date
  end
end
