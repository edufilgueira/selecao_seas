class AddUsuarioCorrigiuPontuacaoToInscricaoLideranca < ActiveRecord::Migration[5.2]
  def change
    add_column :inscricao_liderancas, :usuario_corrigiu_pontuacao, :integer
  end
end
