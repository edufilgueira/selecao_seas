class AddCotaNegroToInscricaoServidors < ActiveRecord::Migration[5.2]
  def change
    add_column :inscricao_servidors, :cota_negro, :boolean
  end
end
