class AddAtivoToInscricaoLiderancas < ActiveRecord::Migration[5.2]
  def change
    add_column :inscricao_liderancas, :ativo, :boolean, :default => true
  end
end
