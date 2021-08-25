class AddStatusToInscricaoServidor < ActiveRecord::Migration[5.2]
  def change
    add_column :inscricao_servidors, :ativo, :boolean, :default => true
  end
end
