class AddRecursoToConfiguracaos < ActiveRecord::Migration[5.2]
  def change
    add_column :configuracaos, :data_inicio_selecao, :date
    add_column :configuracaos, :data_inicio_recurso_pontuacao, :date
    add_column :configuracaos, :data_termino_recurso_pontuacao, :date
  end
end
