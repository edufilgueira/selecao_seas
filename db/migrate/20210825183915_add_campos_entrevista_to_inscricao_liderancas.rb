class AddCamposEntrevistaToInscricaoLiderancas < ActiveRecord::Migration[5.2]
  def change
    add_column :inscricao_liderancas, :avaliacao_entrevista_01, :decimal
    add_column :inscricao_liderancas, :avaliacao_entrevista_02, :decimal
    add_column :inscricao_liderancas, :avaliacao_entrevista_03, :decimal
    add_column :inscricao_liderancas, :avaliacao_entrevista_04, :decimal
    add_column :inscricao_liderancas, :avaliacao_entrevista_05, :decimal
    add_column :inscricao_liderancas, :avaliacao_entrevista_obs, :string
  end
end