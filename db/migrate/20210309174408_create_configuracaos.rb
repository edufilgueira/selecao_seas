class CreateConfiguracaos < ActiveRecord::Migration[5.2]
  def change
    create_table :configuracaos do |t|
      t.date :data_termino_selecao
      t.boolean :status

      t.timestamps
    end
  end
end
