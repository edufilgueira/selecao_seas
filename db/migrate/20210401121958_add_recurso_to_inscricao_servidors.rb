class AddRecursoToInscricaoServidors < ActiveRecord::Migration[5.2]
  def change
    add_column :inscricao_servidors, :recurso_candidato, :text
    add_column :inscricao_servidors, :resposta_recurso_candidato, :text
    add_column :inscricao_servidors, :reclassificar_recurso_candidato, :boolean
    add_column :inscricao_servidors, :recurso_pontuacao, :text
    add_column :inscricao_servidors, :resposta_recurso_pontuacao, :text
    add_column :inscricao_servidors, :reclassificar_recurso_pontuacao, :boolean
  end
end