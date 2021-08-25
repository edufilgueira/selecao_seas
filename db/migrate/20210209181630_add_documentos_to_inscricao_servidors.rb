class AddDocumentosToInscricaoServidors < ActiveRecord::Migration[5.2]
  def change
    add_column :inscricao_servidors, :documentos, :json
  end
end
