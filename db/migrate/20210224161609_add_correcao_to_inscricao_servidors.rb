class AddCorrecaoToInscricaoServidors < ActiveRecord::Migration[5.2]
  def change
    add_column :inscricao_servidors, :correcao, :boolean
  end
end
