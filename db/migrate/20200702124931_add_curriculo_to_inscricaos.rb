class AddCurriculoToInscricaos < ActiveRecord::Migration[5.2]
  def change
    add_column :inscricaos, :curriculo, :json
  end
end
