class AddObservacoesToSelecionarVagas < ActiveRecord::Migration[5.2]
  def change
    add_column :selecionar_vagas, :formacao_academica_01_obs, :text
    add_column :selecionar_vagas, :formacao_academica_02_obs, :text
    add_column :selecionar_vagas, :formacao_academica_03_obs, :text
    add_column :selecionar_vagas, :formacao_academica_04_obs, :text
    add_column :selecionar_vagas, :formacao_academica_05_obs, :text
    add_column :selecionar_vagas, :formacao_academica_06_obs, :text
    add_column :selecionar_vagas, :formacao_academica_07_obs, :text
    add_column :selecionar_vagas, :qualificacao_profissional_01_obs, :text
    add_column :selecionar_vagas, :qualificacao_profissional_02_obs, :text
    add_column :selecionar_vagas, :qualificacao_profissional_03_obs, :text
    add_column :selecionar_vagas, :qualificacao_profissional_04_obs, :text
    add_column :selecionar_vagas, :experiencia_profissional_01_obs, :text
    add_column :selecionar_vagas, :experiencia_profissional_02_obs, :text
    add_column :selecionar_vagas, :experiencia_profissional_03_obs, :text
    add_column :selecionar_vagas, :experiencia_profissional_04_obs, :text
    add_column :selecionar_vagas, :experiencia_profissional_05_obs, :text
  end
end
