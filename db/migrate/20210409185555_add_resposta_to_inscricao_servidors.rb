class AddRespostaToInscricaoServidors < ActiveRecord::Migration[5.2]
  def change
    add_column :inscricao_servidors, :formacao_academica_01_resposta, :integer
    add_column :inscricao_servidors, :formacao_academica_02_resposta, :integer
    add_column :inscricao_servidors, :formacao_academica_03_resposta, :integer
    add_column :inscricao_servidors, :formacao_academica_04_resposta, :integer
    add_column :inscricao_servidors, :formacao_academica_05_resposta, :integer
    add_column :inscricao_servidors, :formacao_academica_06_resposta, :integer
    add_column :inscricao_servidors, :formacao_academica_07_resposta, :integer
    add_column :inscricao_servidors, :qualificacao_profissional_01_resposta, :integer
    add_column :inscricao_servidors, :qualificacao_profissional_02_resposta, :integer
    add_column :inscricao_servidors, :qualificacao_profissional_03_resposta, :integer
    add_column :inscricao_servidors, :qualificacao_profissional_04_resposta, :integer
    add_column :inscricao_servidors, :experiencia_profissional_01_resposta, :integer
    add_column :inscricao_servidors, :experiencia_profissional_02_resposta, :integer
    add_column :inscricao_servidors, :experiencia_profissional_03_resposta, :integer
    add_column :inscricao_servidors, :experiencia_profissional_04_resposta, :integer
    add_column :inscricao_servidors, :experiencia_profissional_05_resposta, :integer
  end
end
