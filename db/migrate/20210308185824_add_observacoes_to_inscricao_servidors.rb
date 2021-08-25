class AddObservacoesToInscricaoServidors < ActiveRecord::Migration[5.2]
  def change
    add_column :inscricao_servidors, :observacao, :text
  end
end
