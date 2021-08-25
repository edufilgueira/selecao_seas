class CreateLocalContratacaos < ActiveRecord::Migration[5.2]
  def change
    create_table :local_contratacaos do |t|
      t.string :descricao

      t.timestamps
    end
  end
end
