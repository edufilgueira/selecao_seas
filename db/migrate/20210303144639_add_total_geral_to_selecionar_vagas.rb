class AddTotalGeralToSelecionarVagas < ActiveRecord::Migration[5.2]
  def change
    add_column :selecionar_vagas, :total_geral_candidato, :decimal
    add_column :selecionar_vagas, :total_geral_correcao, :decimal
  end
end
