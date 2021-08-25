class AddAnexosToInscricaoLiderancas < ActiveRecord::Migration[5.2]
  def change
    add_column :inscricao_liderancas, :certificado_ensino_medio, :json
    add_column :inscricao_liderancas, :certificado_ensino_superior, :json
    add_column :inscricao_liderancas, :formacao_academica_01_candidato, :decimal
    add_column :inscricao_liderancas, :formacao_academica_01_correcao, :decimal
    add_column :inscricao_liderancas, :formacao_academica_02_candidato, :decimal
    add_column :inscricao_liderancas, :formacao_academica_02_correcao, :decimal
    add_column :inscricao_liderancas, :formacao_academica_03_candidato, :decimal
    add_column :inscricao_liderancas, :formacao_academica_03_correcao, :decimal
    add_column :inscricao_liderancas, :formacao_academica_04_candidato, :decimal
    add_column :inscricao_liderancas, :formacao_academica_04_correcao, :decimal
    add_column :inscricao_liderancas, :formacao_academica_05_candidato, :decimal
    add_column :inscricao_liderancas, :formacao_academica_05_correcao, :decimal
    add_column :inscricao_liderancas, :experiencia_profissional_01_candidato, :decimal
    add_column :inscricao_liderancas, :experiencia_profissional_01_correcao, :decimal
    add_column :inscricao_liderancas, :experiencia_profissional_02_candidato, :decimal
    add_column :inscricao_liderancas, :experiencia_profissional_02_correcao, :decimal
    add_column :inscricao_liderancas, :experiencia_profissional_03_candidato, :decimal
    add_column :inscricao_liderancas, :experiencia_profissional_03_correcao, :decimal
    add_column :inscricao_liderancas, :formacao_academica_01_file, :json
    add_column :inscricao_liderancas, :formacao_academica_02_file, :json
    add_column :inscricao_liderancas, :formacao_academica_03_file, :json
    add_column :inscricao_liderancas, :formacao_academica_04_file, :json
    add_column :inscricao_liderancas, :formacao_academica_05_file, :json
    add_column :inscricao_liderancas, :experiencia_profissional_01_file, :json
    add_column :inscricao_liderancas, :experiencia_profissional_02_file, :json
    add_column :inscricao_liderancas, :experiencia_profissional_03_file, :json
    add_column :inscricao_liderancas, :formacao_academica_total, :decimal
    add_column :inscricao_liderancas, :experiencia_profissional_total, :decimal
    add_column :inscricao_liderancas, :formacao_academica_soma_candidato, :decimal
    add_column :inscricao_liderancas, :experiencia_profissional_soma_candidato, :decimal
    add_column :inscricao_liderancas, :formacao_academica_soma_correcao, :decimal
    add_column :inscricao_liderancas, :experiencia_profissional_soma_correcao, :decimal
    add_column :inscricao_liderancas, :formacao_academica_01_verificar, :boolean
    add_column :inscricao_liderancas, :formacao_academica_02_verificar, :boolean
    add_column :inscricao_liderancas, :formacao_academica_03_verificar, :boolean
    add_column :inscricao_liderancas, :formacao_academica_04_verificar, :boolean
    add_column :inscricao_liderancas, :formacao_academica_05_verificar, :boolean
    add_column :inscricao_liderancas, :experiencia_profissional_01_verificar, :boolean
    add_column :inscricao_liderancas, :experiencia_profissional_02_verificar, :boolean
    add_column :inscricao_liderancas, :experiencia_profissional_03_verificar, :boolean
    add_column :inscricao_liderancas, :formacao_academica_01_obs, :text
    add_column :inscricao_liderancas, :formacao_academica_02_obs, :text
    add_column :inscricao_liderancas, :formacao_academica_03_obs, :text
    add_column :inscricao_liderancas, :formacao_academica_04_obs, :text
    add_column :inscricao_liderancas, :formacao_academica_05_obs, :text
    add_column :inscricao_liderancas, :experiencia_profissional_01_obs, :text
    add_column :inscricao_liderancas, :experiencia_profissional_02_obs, :text
    add_column :inscricao_liderancas, :experiencia_profissional_03_obs, :text
    add_column :inscricao_liderancas, :total_geral_candidato, :decimal
    add_column :inscricao_liderancas, :total_geral_correcao, :decimal
    add_column :inscricao_liderancas, :formacao_academica_01_resposta, :integer
    add_column :inscricao_liderancas, :formacao_academica_02_resposta, :integer
    add_column :inscricao_liderancas, :formacao_academica_03_resposta, :integer
    add_column :inscricao_liderancas, :formacao_academica_04_resposta, :integer
    add_column :inscricao_liderancas, :formacao_academica_05_resposta, :integer
    add_column :inscricao_liderancas, :experiencia_profissional_01_resposta, :integer
    add_column :inscricao_liderancas, :experiencia_profissional_02_resposta, :integer
    add_column :inscricao_liderancas, :experiencia_profissional_03_resposta, :integer
  end
end