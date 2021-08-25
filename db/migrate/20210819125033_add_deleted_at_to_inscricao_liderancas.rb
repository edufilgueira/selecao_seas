class AddDeletedAtToInscricaoLiderancas < ActiveRecord::Migration[5.2]
  def change
    add_column :inscricao_liderancas, :deleted_at, :datetime
    add_index :inscricao_liderancas, :deleted_at
  end
end
