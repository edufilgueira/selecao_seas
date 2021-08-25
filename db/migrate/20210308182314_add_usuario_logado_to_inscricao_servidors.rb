class AddUsuarioLogadoToInscricaoServidors < ActiveRecord::Migration[5.2]
  def change
    add_column :inscricao_servidors, :usuario_corrigiu_dados, :integer
    add_column :inscricao_servidors, :usuario_corrigiu_pontuacao, :integer
  end
end
