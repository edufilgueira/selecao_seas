class AddSomasToSelecionarVagas < ActiveRecord::Migration[5.2]
  def change
    add_column :selecionar_vagas, :formacao_academica_total, :decimal
    add_column :selecionar_vagas, :qualificacao_profissional_total, :decimal
    add_column :selecionar_vagas, :experiencia_profissional_total, :decimal
    add_column :selecionar_vagas, :formacao_academica_soma_candidato, :decimal
    add_column :selecionar_vagas, :qualificacao_profissional_soma_candidato, :decimal
    add_column :selecionar_vagas, :experiencia_profissional_soma_candidato, :decimal
    add_column :selecionar_vagas, :formacao_academica_soma_correcao, :decimal
    add_column :selecionar_vagas, :qualificacao_profissional_soma_correcao, :decimal
    add_column :selecionar_vagas, :experiencia_profissional_soma_correcao, :decimal
  end
end
