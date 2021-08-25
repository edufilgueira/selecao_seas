class AddSlugToInscricaoServidors < ActiveRecord::Migration[5.2]
  def change
    add_column :inscricao_servidors, :slug, :text
  end
end
