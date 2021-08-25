class AddAnexosToSelecionarVagas < ActiveRecord::Migration[5.2]
  def change
    add_column :selecionar_vagas, :formacao_academica_01_file, :json
    add_column :selecionar_vagas, :formacao_academica_02_file, :json
    add_column :selecionar_vagas, :formacao_academica_03_file, :json
    add_column :selecionar_vagas, :formacao_academica_04_file, :json
    add_column :selecionar_vagas, :formacao_academica_05_file, :json
    add_column :selecionar_vagas, :formacao_academica_06_file, :json
    add_column :selecionar_vagas, :formacao_academica_07_file, :json
    add_column :selecionar_vagas, :qualificacao_profissional_01_file, :json
    add_column :selecionar_vagas, :qualificacao_profissional_02_file, :json
    add_column :selecionar_vagas, :qualificacao_profissional_03_file, :json
    add_column :selecionar_vagas, :qualificacao_profissional_04_file, :json
    add_column :selecionar_vagas, :experiencia_profissional_01_file, :json
    add_column :selecionar_vagas, :experiencia_profissional_02_file, :json
    add_column :selecionar_vagas, :experiencia_profissional_03_file, :json
    add_column :selecionar_vagas, :experiencia_profissional_04_file, :json
    add_column :selecionar_vagas, :experiencia_profissional_05_file, :json
  end
end
