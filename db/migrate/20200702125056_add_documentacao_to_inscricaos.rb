class AddDocumentacaoToInscricaos < ActiveRecord::Migration[5.2]
  def change
    add_column :inscricaos, :documentacao, :json
  end
end
