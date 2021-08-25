class InscricaoLideranca < ApplicationRecord
  audited
  acts_as_paranoid
  belongs_to :cargo

  has_many :regiaos, class_name: 'Regiao'

  accepts_nested_attributes_for :regiaos, reject_if: :all_blank, allow_destroy: true

  mount_uploader :documentos, DocumentUploader
  mount_uploader :deficiente_anexo, DocumentUploader
  mount_uploader :represetacao_classe, DocumentUploader
  mount_uploader :certificado_ensino_superior, DocumentUploader
  mount_uploaders :formacao_academica_01_file, DocumentUploader
  mount_uploaders :formacao_academica_02_file, DocumentUploader
  mount_uploaders :formacao_academica_03_file, DocumentUploader
  mount_uploaders :formacao_academica_04_file, DocumentUploader
  mount_uploaders :formacao_academica_05_file, DocumentUploader
  mount_uploaders :experiencia_profissional_01_file, DocumentUploader
  mount_uploaders :experiencia_profissional_02_file, DocumentUploader
  mount_uploaders :experiencia_profissional_03_file, DocumentUploader
  
  validates :cpf, :nome_completo, :naturalidade, :nacionalidade, :nome_mae, :data_nascimento, :sexo, :estado_civil, :rg, :orgao_emissor, :endereco, :bairro, :cidade, :uf, :cep, :telefone_celular, :email, presence: true
  validates :cpf, uniqueness: true

  def formacao_academica_01_resposta_descricao
    self.formacao_academica_01_resposta.blank? ? "" : Resposta.find(self.formacao_academica_01_resposta).descricao
  end
  def formacao_academica_02_resposta_descricao
    self.formacao_academica_02_resposta.blank? ? "" : Resposta.find(self.formacao_academica_02_resposta).descricao
  end
  def formacao_academica_03_resposta_descricao
    self.formacao_academica_03_resposta.blank? ? "" : Resposta.find(self.formacao_academica_03_resposta).descricao
  end
  def formacao_academica_04_resposta_descricao
    self.formacao_academica_04_resposta.blank? ? "" : Resposta.find(self.formacao_academica_04_resposta).descricao
  end
  def formacao_academica_05_resposta_descricao
    self.formacao_academica_05_resposta.blank? ? "" : Resposta.find(self.formacao_academica_05_resposta).descricao
  end
  def experiencia_profissional_01_resposta_descricao
    self.experiencia_profissional_01_resposta.blank? ? "" : Resposta.find(self.experiencia_profissional_01_resposta).descricao
  end
  def experiencia_profissional_02_resposta_descricao
    self.experiencia_profissional_02_resposta.blank? ? "" : Resposta.find(self.experiencia_profissional_02_resposta).descricao
  end
  def experiencia_profissional_03_resposta_descricao
    self.experiencia_profissional_03_resposta.blank? ? "" : Resposta.find(self.experiencia_profissional_03_resposta).descricao
  end

  def self.uf
    { 'CE'=>'CE',
      'AC'=>'AC',
      'AL'=>'AL',
      'AP'=>'AP',
      'AM'=>'AM',
      'BA'=>'BA',
      'DF'=>'DF',
      'ES'=>'ES',
      'GO'=>'GO',
      'MA'=>'MA',
      'MT'=>'MT',
      'MS'=>'MS',
      'MG'=>'MG',
      'PA'=>'PA',
      'PB'=>'PB',
      'PR'=>'PR',
      'PE'=>'PE',
      'PI'=>'PI',
      'RJ'=>'RJ',
      'RN'=>'RN',
      'RS'=>'RS',
      'RO'=>'RO',
      'RR'=>'RR',
      'SC'=>'SC',
      'SP'=>'SP',
      'SE'=>'SE',
      'TO'=>'TO'}
  end
end
