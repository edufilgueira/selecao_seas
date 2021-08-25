class AddColumnsToInscricaos < ActiveRecord::Migration[5.2]
  def change
    add_column :inscricaos, :recurso_solicitado, :boolean
    add_column :inscricaos, :recurso, :json
  end
end
