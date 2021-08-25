class StatusAcompanhamentoToInscricaoServidors < ActiveRecord::Migration[5.2]
  def change
    add_column :inscricao_servidors, :status_acompanhamento, :string
  end
end
