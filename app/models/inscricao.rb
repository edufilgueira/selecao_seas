class Inscricao < ApplicationRecord
  audited
  mount_uploader :curriculo, DocumentUploader
  mount_uploaders :documentacao, DocumentUploader
  mount_uploader :recurso, DocumentUploader
  validates :nome_completo, :naturalidade, :nacionalidade, :nome_mae, :sexo, :estado_civil, :data_nascimento, :cpf, :rg, :orgao_emissor, :endereco, :bairro, :cidade, :uf, :cep, :telefone_celular, :email, :formacao, :termo_aceito, presence: true
  validates :cpf, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
