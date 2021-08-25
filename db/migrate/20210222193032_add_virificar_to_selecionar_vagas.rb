class AddVirificarToSelecionarVagas < ActiveRecord::Migration[5.2]
  def change
    add_column :selecionar_vagas, :formacao_academica_01_verificar, :boolean
    add_column :selecionar_vagas, :formacao_academica_02_verificar, :boolean
    add_column :selecionar_vagas, :formacao_academica_03_verificar, :boolean
    add_column :selecionar_vagas, :formacao_academica_04_verificar, :boolean
    add_column :selecionar_vagas, :formacao_academica_05_verificar, :boolean
    add_column :selecionar_vagas, :formacao_academica_06_verificar, :boolean
    add_column :selecionar_vagas, :formacao_academica_07_verificar, :boolean
    add_column :selecionar_vagas, :qualificacao_profissional_01_verificar, :boolean
    add_column :selecionar_vagas, :qualificacao_profissional_02_verificar, :boolean
    add_column :selecionar_vagas, :qualificacao_profissional_03_verificar, :boolean
    add_column :selecionar_vagas, :qualificacao_profissional_04_verificar, :boolean
    add_column :selecionar_vagas, :experiencia_profissional_01_verificar, :boolean
    add_column :selecionar_vagas, :experiencia_profissional_02_verificar, :boolean
    add_column :selecionar_vagas, :experiencia_profissional_03_verificar, :boolean
    add_column :selecionar_vagas, :experiencia_profissional_04_verificar, :boolean
    add_column :selecionar_vagas, :experiencia_profissional_05_verificar, :boolean
  end
end
