class CreateInscricaoServidors < ActiveRecord::Migration[5.2]
  def change
    create_table :inscricao_servidors do |t|
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

      t.timestamps
    end
  end
end
