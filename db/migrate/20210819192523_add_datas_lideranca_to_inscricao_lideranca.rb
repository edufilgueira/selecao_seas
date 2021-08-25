class AddDatasLiderancaToInscricaoLideranca < ActiveRecord::Migration[5.2]
  def change
    add_column :configuracaos, :data_inicio_selecao_lideranca, :date
    add_column :configuracaos, :data_termino_selecao_lideranca, :date
    add_column :configuracaos, :data_inicio_recurso_lideranca, :date
    add_column :configuracaos, :data_termino_recurso_lideranca, :date
    add_column :configuracaos, :data_inicio_entrevista_lideranca, :date
    add_column :configuracaos, :data_termino_entrevista_lideranca, :date
  end
end
