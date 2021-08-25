class SelecionarVaga < ApplicationRecord
  belongs_to :inscricao_servidor
  belongs_to :cargo
  mount_uploader :formacao_academica_01_file, DocumentUploader
  mount_uploader :formacao_academica_02_file, DocumentUploader
  mount_uploader :formacao_academica_03_file, DocumentUploader
  mount_uploader :formacao_academica_04_file, DocumentUploader
  mount_uploader :formacao_academica_05_file, DocumentUploader
  mount_uploader :formacao_academica_06_file, DocumentUploader
  mount_uploader :formacao_academica_07_file, DocumentUploader
  mount_uploader :qualificacao_profissional_01_file, DocumentUploader
  mount_uploader :qualificacao_profissional_02_file, DocumentUploader
  mount_uploader :qualificacao_profissional_03_file, DocumentUploader
  mount_uploader :qualificacao_profissional_04_file, DocumentUploader
  mount_uploader :experiencia_profissional_01_file, DocumentUploader
  mount_uploader :experiencia_profissional_02_file, DocumentUploader
  mount_uploader :experiencia_profissional_03_file, DocumentUploader
  mount_uploader :experiencia_profissional_04_file, DocumentUploader
  mount_uploader :experiencia_profissional_05_file, DocumentUploader
  validates :inscricao_servidor_id, uniqueness: true
end
