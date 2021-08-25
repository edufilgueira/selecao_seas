class RecursoServidor < ApplicationRecord
  audited
  belongs_to :inscricao_servidor
  validates :inscricao_servidor_id, uniqueness: true
end
