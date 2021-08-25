class CreateInscricaoLiderancas < ActiveRecord::Migration[5.2]
  def change
    create_table :inscricao_liderancas do |t|
      t.string :cpf
      t.string :nome_completo
      t.string :naturalidade
      t.string :nacionalidade
      t.boolean :pessoa_com_deficiencia
      t.string :nome_mae
      t.string :sexo
      t.string :estado_civil
      t.date :data_nascimento
      t.string :rg
      t.string :orgao_emissor
      t.string :endereco
      t.string :complemento
      t.string :bairro
      t.string :cidade
      t.string :uf
      t.string :cep
      t.string :telefone_fixo
      t.string :telefone_celular
      t.string :email
      t.string :orgao_representacao_classe
      t.string :numero_registro
      t.boolean :termo_aceito
      t.boolean :recurso_solicitado
      t.json :recurso
      t.json :documentos
      t.boolean :finalizar
      t.boolean :deficiente
      t.json :deficiente_anexo
      t.boolean :correcao
      t.text :slug
      t.string :status_acompanhamento
      t.integer :usuario_corrigiu_dados
      t.text :observacao
      t.json :represetacao_classe
      t.boolean :cota_negro
      t.text :recurso_candidato_dados
      t.text :resposta_recurso_candidato_dados
      t.boolean :reclassificar_recurso_candidato_dados
      t.text :recurso_entrevista
      t.text :resposta_recurso_entrevista
      t.boolean :reclassificar_recurso_entrevista

      t.timestamps
    end
  end
end
