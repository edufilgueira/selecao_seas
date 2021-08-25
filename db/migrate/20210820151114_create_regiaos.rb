class CreateRegiaos < ActiveRecord::Migration[5.2]
  def change
    create_table :regiaos do |t|
      t.references :inscricao_lideranca, foreign_key: true
      t.string :descricao
      t.integer :ordem

      t.timestamps
    end
  end
end
