class AddDataApresetacaoDadosLiderancaToInscricaoLideranca < ActiveRecord::Migration[5.2]
  def change
    add_column :configuracaos, :data_apresetacao_dados_lideranca, :date
  end
end
