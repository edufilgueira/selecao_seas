class CreateRecursoServidors < ActiveRecord::Migration[5.2]
  def change
    create_table :recurso_servidors do |t|
      t.references :inscricao_servidor, foreign_key: true
      t.text :texto

      t.timestamps
    end
  end
end
