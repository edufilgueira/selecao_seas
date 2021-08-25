class AddDeletedAtToInscricaoServidors < ActiveRecord::Migration[5.2]
  def change
    add_column :inscricao_servidors, :deleted_at, :datetime
    add_index :inscricao_servidors, :deleted_at
  end
end
