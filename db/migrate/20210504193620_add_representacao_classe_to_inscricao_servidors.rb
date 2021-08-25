class AddRepresentacaoClasseToInscricaoServidors < ActiveRecord::Migration[5.2]
  def change
    add_column :inscricao_servidors, :represetacao_classe, :json
  end
end
