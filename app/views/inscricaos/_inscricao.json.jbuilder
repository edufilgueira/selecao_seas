json.extract! inscricao, :id, :nome_completo, :naturalidade, :nacionalidade, :nome_mae, :sexo, :estado_civil, :data_nascimento, :cpf, :rg, :orgao_emissor, :endereco, :complemento, :bairro, :cidade, :uf, :cep, :telefone_fixo, :telefone_celular, :email, :formacao, :orgao_representacao_classe, :numero_registro, :termo_aceito, :created_at, :updated_at
json.url inscricao_url(inscricao, format: :json)
