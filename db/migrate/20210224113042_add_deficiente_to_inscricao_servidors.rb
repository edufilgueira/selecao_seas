class AddDeficienteToInscricaoServidors < ActiveRecord::Migration[5.2]
  def change
    add_column :inscricao_servidors, :deficiente, :boolean
    add_column :inscricao_servidors, :deficiente_anexo, :json
  end
end
