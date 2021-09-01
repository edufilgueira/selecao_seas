class AddSomaTotalToInscricaoLideranca < ActiveRecord::Migration[5.2]
  def change
    add_column :inscricao_liderancas, :soma_total, :decimal
  end
end
