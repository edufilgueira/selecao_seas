class AddFinalizarToInscricaoServidors < ActiveRecord::Migration[5.2]
  def change
    add_column :inscricao_servidors, :finalizar, :boolean
  end
end
