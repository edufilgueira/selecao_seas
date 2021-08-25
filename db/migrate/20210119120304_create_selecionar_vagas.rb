class CreateSelecionarVagas < ActiveRecord::Migration[5.2]
  def change
    create_table :selecionar_vagas do |t|
      t.references :inscricao_servidor, foreign_key: true
      t.references :cargo, foreign_key: true
      t.boolean :sexo
      t.decimal :formacao_academica_01_candidato
      t.decimal :formacao_academica_01_correcao
      t.decimal :formacao_academica_02_candidato
      t.decimal :formacao_academica_02_correcao
      t.decimal :formacao_academica_03_candidato
      t.decimal :formacao_academica_03_correcao
      t.decimal :formacao_academica_04_candidato
      t.decimal :formacao_academica_04_correcao
      t.decimal :formacao_academica_05_candidato
      t.decimal :formacao_academica_05_correcao
      t.decimal :formacao_academica_06_candidato
      t.decimal :formacao_academica_06_correcao
      t.decimal :formacao_academica_07_candidato
      t.decimal :formacao_academica_07_correcao
      t.decimal :qualificacao_profissional_01_candidato
      t.decimal :qualificacao_profissional_01_correcao
      t.decimal :qualificacao_profissional_02_candidato
      t.decimal :qualificacao_profissional_02_correcao
      t.decimal :qualificacao_profissional_03_candidato
      t.decimal :qualificacao_profissional_03_correcao
      t.decimal :qualificacao_profissional_04_candidato
      t.decimal :qualificacao_profissional_04_correcao
      t.decimal :experiencia_profissional_01_candidato
      t.decimal :experiencia_profissional_01_correcao
      t.decimal :experiencia_profissional_02_candidato
      t.decimal :experiencia_profissional_02_correcao
      t.decimal :experiencia_profissional_03_candidato
      t.decimal :experiencia_profissional_03_correcao
      t.decimal :experiencia_profissional_04_candidato
      t.decimal :experiencia_profissional_04_correcao
      t.decimal :experiencia_profissional_05_candidato
      t.decimal :experiencia_profissional_05_correcao
      
      t.timestamps
    end
  end
end
